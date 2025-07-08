  function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_persicus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_persicus'; 
metaData.species_en = 'Persian Sturgeon'; 

metaData.ecoCode.climate = {'MB','BWk','BSk'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'ah';'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour Poodeh'; 'Jaap van der Meer'};        
metaData.date_subm = [2019 02 18];                           
metaData.email    = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Royal Netherlands Institute For Sea Research (NIOZ)'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 20]; 

%% set data
% zero-variate data
data.ah = 6;       units.ah = 'd';     label.ah = 'age at hatch';          bibkey.ah = {'ImanFala2017'};
  temp.ah = C2K(20); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = {'ImanFala2017'}; 
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = 4380;   units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'KottFrey2007'};
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for female: ap = 12-18 yr; for males: ap = 8-15 yr (KottFrey2007)';
data.am = 14235;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'Coad2018';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is wild guess';

data.Lb = 2.57;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'ImanFala2017';
data.Lp = 155;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'KottFrey2007';
data.Li = 230;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'NazaPour2013';

data.Wwp = 28000;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'AlavKara2005';
data.Wwi = 70000;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'VecsArty2001';
  
data.Ri = 301.3;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'SiddCoss2014';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
 %univariate data
 
 data.tL = [... % time since hatching (d), total length (cm) 
    1 1.097
    2 1.410
    3 1.460
    4 1.527
    5 1.720
    6 1.847
    7 2.00
    8 2.133
    9 2.190
    10 2.283
    11 2.337
    12 2.350
    13 2.460
    14 2.557
    15 2.57
    16 2.625
    17 2.667
    18 2.787
    19 2.865
    20 2.950
    21 3.00];
units.tL = {'d', 'cm'}; label.tL = {'time since hatching', 'total length'};
temp.tL = C2K (21); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ImanFala2017';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%% weights.psd.Kap_G = 0.11 * weights.psd.Kap_G;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts 
F1 = 'Length-weight: Ww (in g) = 0.0139 * (TL in cm)^2.807';
metaData.bibkey.F1 = 'MousGhaf2014';

F2 = 'Growth parameters of Von bertalanffy equation in males is: infinity length = 164.33 cm, growth coefficien (k) = 0.08, time at 0 age (t0) = -3.26 and for females is: infinity length = 173.07 cm, growth coefficien (k) = 0.11, time at 0 age (t0) = -0.94';
metaData.bibkey.F2 = 'BakhAbdo2012';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '9C6Y'; % Cat of Life
metaData.links.id_ITIS = '550553'; % ITIS
metaData.links.id_EoL = '46561175'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_persicus'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_persicus'; % ADW
metaData.links.id_Taxo = '107325'; % Taxonomicon
metaData.links.id_WoRMS = '238344'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-persicus'; % fishbase


%% References
bibkey = 'Coad2018'; type = 'Misc'; bib = [ ...
'year = {2018}, ' ...
'author = {Brian W. Coad}, ' ...
'howpublished = {\url{http://www.briancoad.com/Species Accounts/Description and Acipenseridae to Chanidae.htm}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KottFrey2007'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kottelat, M. and Freyhof, J.}, ' ...
'year = {2007}, ' ...
'title  = {Handbook of European Freshwater Fishes}, ' ...
'publisher = {Maurice Kottelat (privately published)}, ' ...
'Address = {Berlin},' ...
'pages = {646 pp}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddCoss2014'; type = 'Article'; bib = [ ...  
'author = {Siddique, J. Cosson and Psenicka, M. and Linhart, O.}, ' ...
'year = {2014}, ' ...
'title = {Areview of the structure of sturgeon egg membrances and of the associated terminology}, ' ... 
'journal = {Applied Ichthyology}, ' ...
'pages = {1246-1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NazaPour2013'; type = 'Article'; bib = [ ...    
'author = {Nazari, S. and Pourkazemi, M. and Khoshkholgh, M. R. and Azizzadeh, L.}, ' ...
'year  = {2013}, ' ...
'title = {Population structure and variation in Persian sturgeon (\emph{Acipenser percicus}) from the {C}aspian {S}ea as determind from mitochondrial {DNA} sequences of the control region}, ' ...  
'journal = {Progress in Biological Sciences}, ' ...
'volume = {2}, ' ...
'pages = {67-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VecsArty2001'; type = 'Article'; bib = [ ...    
'author = {Vecsei, P. and Artyukhin, E.}, ' ...
'year  = {2001}, ' ...
'title = {Threatened fishes of the world: \emph{Acipenser persicus} {B}orodin}, ' ...  
'journal = {Environmental Biology of Fishes}, ' ...
'pages = {160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlavKara2005'; type = 'Article'; bib = [ ...    
'author = {Alavi, M. H. and Karami, M. and Abdoulhay, H. and Ghadirnejad, S. H.}, ' ...
'year  = {2005}, ' ...
'title = {Length, weight and age relationships of the {P}ersian sturgeon \emph{Acipenser persicus} in the southeast of og the {C}aspian Sea: A case study at {T}urkaman Station during summer catching}, ' ...  
'journal = {Iranian Journal of Natural Resources}, ' ...
'volume = {3}, ' ...
'pages = {603-614}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ImanFala2017'; type = 'Article'; bib = [ ...    
'author = {Imani, M. and Falahatkar, B.}, ' ...
'year  = {2017}, ' ...
'title = {Larval Development of {P}ersian {S}turgeon (\emph{Acipenser persicus}) with Emphasis on Determination on Start Feeding}, ' ...  
'journal = {Journal of Animal Researches}, ' ...
'volume = {3}, ' ...
'pages = {301-311}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MousGhaf2014'; type = 'Article'; bib = [ ...    
'author = {Mousavi, S. and Ghafor, A.}, ' ...
'year  = {2014}, ' ...
'title = {On the conditions impressing sturgeon fish}, ' ...  
'journal = {International Journal of Advanced and Applied Sciences}, ' ...
'volume = {4}, ' ...
'pages = {1-5}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BakhAbdo2012'; type = 'Article'; bib = [ ...    
'author = {Bakhshalizadeh and Abdolmalaki and Bani}, ' ...
'year  = {2012}, ' ...
'title = {Aspects of the life history of \emph{Acipenser stellatus} ({A}cipenseriformes, {A}cipenseridae), the starry sturgeonBak, in {I}ranian waters of the {C}aspian {S}ea}, ' ...  
'journal = {Aqua International Journal of Ichthyology}, ' ...
'volume = {2}, ' ...
'pages = {103-112}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

