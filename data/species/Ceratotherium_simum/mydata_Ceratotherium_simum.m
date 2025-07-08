function [data, auxData, metaData, txtData, weights] = mydata_Ceratotherium_simum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Rhinocerotidae';
metaData.species    = 'Ceratotherium_simum'; 
metaData.species_en = 'White rhinoceros'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2018 09 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 06]; 


%% set data
% zero-variate data

data.tg = 515;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1643;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 45*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 350;   units.Li  = 'cm';  label.Li  = 'ultimate body length for females';   bibkey.Li  = 'Wiki';
  comment.Li = '3.4 to 3.65 m';
data.Lim  = 385;   units.Lim  = 'cm';  label.Lim  = 'ultimate body length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '3.7 to 4 m';

data.Wwb = 52.5e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 715110;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
  comment.Wwx = 'computed as Wb + tx*(885812 - 58000)/456 based on Rhinoceros_unicornis';
data.Wwi = 2175e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/1009;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (kg)
      3  38.5
     26  75
     41  80
     51 100
     53  95
     94 137
    105 145
    121 163
    155 205
    200 325
    210 325
    218 121.6
    236 350
    282 385 
    365 410];
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(36.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mall1973';
%
data.tW1 = [ ... % time since birth (d), weight (kg)
     17  47.7
     30  48.5
     64  53.75
     94  62.8
    125  73
    156  91
    186 109.3
    218 121.6
    247 122.5
    276 136.1
    337 156.5
    365 188.2];
data.tW1(:,2) = 1e3 * data.tW1(:,2); % convert kg to g
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1  = C2K(36.7);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Mall1973';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-6; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'data for 3 male calves'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'SQFF'; % Cat of Life
metaData.links.id_ITIS = '625001'; % ITIS
metaData.links.id_EoL = '311503'; % Ency of Life
metaData.links.id_Wiki = 'Ceratotherium_simum'; % Wikipedia
metaData.links.id_ADW = 'Ceratotherium_simum'; % ADW
metaData.links.id_Taxo = '69123'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100050'; % MSW3
metaData.links.id_AnAge = 'Ceratotherium_simum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceratotherium_simum}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ceratotherium_simum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ditt1972'; type = 'Article'; bib = [ ... 
'author = {Dittrich, L.}, ' ... 
'doi = {10.1111/j.1748-1090.1972.tb02295.x}, ' ...
'year = {1972}, ' ...
'title = {Birth and growth of a male White rhinoceros (\emph{Cerathotherium simum simum}) at {H}anover {Z}oo}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {12}, ' ...
'pages = {122-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
