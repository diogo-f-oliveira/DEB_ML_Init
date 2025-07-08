  function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_gueldenstaedtii


%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_gueldenstaedtii'; 
metaData.species_en = 'Russian Sturgeon'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm','THp'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour Poodeh'; 'Jaap van der Meer'};        
metaData.date_subm = [2019 02 18];                           
metaData.email    = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Royal Netherlands Institute For Sea Research (NIOZ)'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 20]; 

%% set data
% zero-variate data

data.ah = 7;     units.ah = 'd';   label.ah = 'age at birth';           bibkey.ah = 'MemiErca2009'; 
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 9; units.ab = 'd'; label.ab = 'age at birth';     bibkey.ab = 'MemiErca2009'; 
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4745;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'Birs1993';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 14235;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'Coad2018';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.8;    units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'MikhElen2013';
data.Lp = 110;    units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'Fishbase'; 
data.Li = 236;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'NazaPour2013';

data.Wwh = 0.021;  units.Wwh = 'g';   label.Wwh = 'wet weight at hatch';    bibkey.Wwh = 'MikhElen2013';
data.Wwi = 115000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Birs1993';
  
data.Ri = 531.9; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = {'SiddCoss2014'};   
  temp.Ri = C2K(16);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
     
% uni-variate data

data.tW = [... % time since birth (d), wet weight (g)  
    5 0.08
    10 0.7
    22 1.2
    25 1.5
    30 2.3
    35 3.6
    40 5.0
    43 6.0
    46 7.0];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(15); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'MikhElen2013'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.Wh = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'weight 0 was given to Wh, because value does not seem realistic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.0097 * (TL in cm)^2.880';
metaData.bibkey.F1 = 'MousGhaf2014';
metaData.facts = struct('F1',F1);
                           
%% Links
metaData.links.id_CoL = '9C5J'; % Cat of Life
metaData.links.id_ITIS = '161073'; % ITIS
metaData.links.id_EoL = '46561166'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_gueldenstaedtii'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_gueldenstaedtii'; % ADW
metaData.links.id_Taxo = '107316'; % Taxonomicon
metaData.links.id_WoRMS = '126275'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-gueldenstaedtii'; % fishbase


%% References
bibkey = 'Coad2018'; type = 'Misc'; bib = [ ...
'year = {2018}, ' ...
'author = {Brian W. Coad}, ' ...
'howpublished = {\url{http://www.briancoad.com/Species Accounts/Description and Acipenseridae to Chanidae.htm}}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acipenser-gueldenstaedtii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Birs1993'; type = 'Book'; bib = [ ...    
'author = {Birstein V. J}, ' ...
'year  = {1993}, ' ...
'title = {Sturgeons and paddlefishes: threatened fishes in need of conservation}}, ' ...  
'Publisher = {Conservation Biology}, ' ...
'pages = {787pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MemiErca2009'; type = 'Article'; bib = [ ...    
'author = {D. Memis and E. Ercan and M. S. Celikkale and M. Timur and Z. Zarkua}, ' ...
'year  = {2009}, ' ...
'title = {Growth and survival rate of Russian Sturgeon (\emph{Acipenser gueldenstaedtii}) larvae from fertilized eggs to artificial feeding}, ' ...  
'journal = {Turkish Journal of Fisheries and Aquatic}, ' ...
'volume = {9}, ' ...
'pages = {47-52}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MousGhaf2014'; type = 'Article'; bib = [ ...    
'author = {Mousavi, S. and A. Ghafor}, ' ...
'year  = {2014}, ' ...
'title = {On the conditions impressing sturgeon fish}, ' ...  
'journal = {International Journal of Advanced and Applied Sciences}, ' ...
'volume = {4}, ' ...
'pages = {1-5}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MikhElen2013'; type = 'Manual'; bib = [ ...    
'author = {Mikhail S. Chebanov and Elena V. Galich}, ' ...
'year  = {2013}, ' ...
'title = {Sturgeon Hatchery Manual}, ' ...  
'journal = {FAO}, ' ...
'pages = {303pp}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NazaPour2013'; type = 'Article'; bib = [ ...    
'author = {Nazari, S. and Pourkazemi, M. and Khoshkholgh, M. R. and Azizzadeh, L}, ' ...
'year  = {2013}, ' ...
'title = {Population structure and variation in Persian sturgeon (\emph{Acipenser percicus}) from the {C}aspian {S}ea as determind from mitochondrial {DNA} sequences of the control region}, ' ...  
'journal = {Progress in Biological Sciences}, ' ...
'volume = {2}, ' ...
'pages = {67-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddCoss2014'; type = 'Article'; bib = [ ...  
'author = {Siddique, J. Cosson and M. Psenicka and O. Linhart}, ' ...
'year = {2014}, ' ...
'title = {A review of the structure of sturgeon egg membrances and of the associated terminology}, ' ... 
'journal = {Applied Ichthyology}, ' ...
'pages = {1246-1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%