class Profile {

  var name, bio, gender: String

  var tags = [Tag]()


  /*Restricting information*/
  struct Privacy {

    var included_tags = [Tag]()

    struct age_range {
      var low, high: Int
    }
  }

  struct Details {
    var age: Int = 0
    var phone="", address=""
  }

  /*Initilizer*/
  init(name, gender, bio, phone, address: String, age: Int, tags: [Tag]) {
    self.name = name
    self.gender = gender
    self.bio = bio
    self.phone = phone
    self.address = address
    Privacy.age_range.low = 13
    Privacy.age_range.high = 99
    self.tags.append(contentsOf: tags)
  }

  /*If any input value is 0, the original value stands*/
  func set_age_range(low, high: Int) {
    if  low != 0 {
      Privacy.age_range.low = low
    }
    if  high != 0 {
      Privacy.age_range.high = high
    }
  }

  func add_tag(tag: Tag) {
    tags.append(tag)
  }

  /*
  If return value is (nil), the value was not found.
  Else, the deleted value is returned.
  */
  func del_tag(tag: Tag) ->  {
    var re_tag: Tag = nil
    for (index, element) in tags.enumerated() {
      if  element.name == tag.name {
        re_tag = tags.remove(at: index)
      }
    }
    return re_tag
  }


  func set_exclusive_tag(tag: Tag) {
    Privacy.included_tags.append(tag)
  }

  func get_exclusive_tags() -> [Tag] {
  if Privacy.included_tags.isEmpty {
      return nil
    } else {
      return included_tags
    }
  }
}
