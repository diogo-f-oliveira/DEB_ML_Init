function [data, auxData, metaData, txtData, weights] = mydata_Lepomis_cyanellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Lepomis_cyanellus'; 
metaData.species_en = 'Green sunfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 0.5 * 365;  units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'texas';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'ADW: 3 yr';
data.am = 3650;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'texas';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.42;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'texas';  
data.Lp  = 6.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'texas'; 
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'cabi';
  comment.Wwb = 'based on egg diameter of 0.9 to 1.4 mm: pi/6*0.1^3';
data.Wwp = 7;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 960;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 26000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since hatch (d), total length (cm)
    1  4.57
    2  7.11
    3  9.14
    4  10.92
    5  12.19];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'texas';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = ['Common in America. It prefers warmer water and can grow to some 30 cm at a weight of 960 grams. ' ... 
      'Though a more common length is some 20 cm. ' ...
      'It can reach an age of about 10 years and it starts to reproduce between 1 and 3 years of age. ' ...
      'Mature sunfish eat small fish etc.. Fry initially eat zooplankton. ' ...
      'It is regarded as an invasive species in western europe.'];
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TG2D'; % Cat of Life
metaData.links.id_ITIS = '168132'; % ITIS
metaData.links.id_EoL = '207660'; % Ency of Life
metaData.links.id_Wiki = 'Lepomis_cyanellus'; % Wikipedia
metaData.links.id_ADW = 'Lepomis_cyanellus'; % ADW
metaData.links.id_Taxo = '45132'; % Taxonomicon
metaData.links.id_WoRMS = '1022845'; % WoRMS
metaData.links.id_fishbase = 'Lepomis-cyanellus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepomis_cyanellus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DragChis1982'; type = 'Article'; bib = [ ... 
'author = {Drager, B. and Chiszar, D.}, ' ... 
'year = {1982}, ' ...
'title = {Growth rate of bluegill sunfish (\emph{Lepomis macrochirus}) maintained in groups and isolation}, ' ...
'journal = {Bulletin of the Psychonomic Society}, ' ...
'volume = {20}, ' ...
'number = {5}, '...
'pages = {284--286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'texas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/lepomis cyanellus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Lepomis_cyanellus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cabi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cabi.org/isc/datasheet/77079}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

