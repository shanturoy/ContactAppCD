//
//  Contact.swift
//  ContactAppCD
//
//  Created by Shantu Roy on 9/13/15.
//  Copyright (c) 2015 Rackspace. All rights reserved.
//

import Foundation
import CoreData

class Contact: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var phone: String
    @NSManaged var email: String

}
