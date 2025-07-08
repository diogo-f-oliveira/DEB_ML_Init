function [data, auxData, metaData, txtData, weights] = mydata_Erpetoichthys_calabaricus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polypteriformes'; 
metaData.family     = 'Polypteridae';
metaData.species    = 'Erpetoichthys_calabaricus'; 
metaData.species_en = 'Reedfish'; 
metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFe'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2014 05 11];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 17]; 

%% set data
% zero-variate data;
data.ah = 3;      units.ah = 'd';       label.ah = 'age at birth';             bibkey.ah = 'fishkeeping';    
  temp.ah = C2K(26); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'temps of all data are assumed to be what Wiki gives for optimum';
data.ab = 19;     units.ab = 'd';       label.ab = 'age at birth';             bibkey.ab = 'fishkeeping';    
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 6*365;  units.ap = 'd';       label.ap = 'age at puberty';           bibkey.ap = 'fishkeeping';
  temp.ap = C2K(26); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 20*365;  units.am = 'd';      label.am = 'life span';                bibkey.am = 'fishkeeping';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.24;    units.L0  = 'cm';    label.L0  = 'egg diameter';            bibkey.L0  = 'fishkeeping';
data.Lb = 1;       units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishkeeping';
data.L152 = 6;     units.L152  = 'cm';  label.L152  = 'total length at 5 month'; bibkey.L152  = 'fishkeeping';
  temp.L152 = C2K(26);  units.temp.L152 = 'K'; label.temp.L152 = 'temperature';
data.Lp = 31.4;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'for females';
data.Li = 37;      units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki'; 
  comment.Li = 'for females';

data.Wwp = 36.7;   units.Wwp = 'g';     label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Baba2011';
  comment.Wwp = 'computed as 10^(3.04 * log10(31.4) - 2.9864), based on Baba2011';
data.Wwi = 60.4;   units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Baba2011'; 
  comment.Wwi = 'computed as 10^(3.04 * log10(37) - 2.9864), based on Baba2011';

data.Ri  = 1200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 800-1200';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The yolk was separated from the egg surface by a 0.5mm wide jelly-like zone. The eggs had a single micropyle , the sole opening in the egg through which the sperm can enter.'; 
metaData.bibkey.F1 = 'fishkeeping'; 
F2 = 'It can breathe atmospheric air using a pair of lungs.';
metaData.bibkey.F2 = 'Wiki';
F3 = 'female: Log10 W=3.04 Log10 TL-2.9864, Log10 W=3.04 Log10 SL-2.9462; male: Log10 W=2.127 Log10 TL-1.68517 , Log10 W=2.185 Log10 SL-1.7394. (L in cm, W in g)';
metaData.bibkey.F3 = 'Baba2011'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3B9FN'; % Cat of Life
metaData.links.id_ITIS = '161058'; % ITIS
metaData.links.id_EoL = '211502'; % Ency of Life
metaData.links.id_Wiki = 'Erpetoichthys_calabaricus'; % Wikipedia
metaData.links.id_ADW = 'Erpetoichthys_calabaricus'; % ADW
metaData.links.id_Taxo = '174040'; % Taxonomicon
metaData.links.id_WoRMS = '280711'; % WoRMS
metaData.links.id_fishbase = 'Erpetoichthys-calabaricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Erpetoichthys_calabaricus}}';   
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
bibkey = 'Baba2011'; type = 'techreport'; bib = [ ...  
'author = {S. L. Babatunde}, ' ...
'year = {2011}, ' ...
'title  = {MORPHOMETRIC AND MERISTICS CHARACTERISTICS OF \emph{Erpetoichthys calabaricus} FROM WETLAND OF {O}GUN WATER-SIDE LOCAL GOVERNMENT AREA.}, ' ...
'institution = {Universtity of Agriculture, Abeokuta, Ogun State, Nigeria}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishkeeping'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.practicalfishkeeping.co.uk/content.php?sid=3121}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.mnhn.fr/summary/SpeciesSummary.php?ID=4830}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  