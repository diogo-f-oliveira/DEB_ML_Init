function [data, auxData, metaData, txtData, weights] = mydata_Micropterus_dolomieu

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Micropterus_dolomieu'; 
metaData.species_en = 'Smallmouth bass'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 06];

%% set data
% zero-variate data

data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2 * 365;  units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'WelsWieg2017';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 26*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.23;  units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW'; 
data.Lp  = 22;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 69;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.82e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp = 175;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on (Lp/Li)^3*WWi';
data.Wwi = 5400;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 21100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since hatch (d), total length (mm)
1.082	64.465
1.092	68.185
1.102	71.906
1.102	80.097
1.102	85.310
1.102	92.012
2.059	201.940
2.069	175.128
2.079	186.296
2.088	146.825
2.088	154.272
2.088	160.974
2.088	166.187
2.107	133.415
3.065	234.406
3.075	243.339
3.084	192.698
3.084	203.869
3.084	226.209
3.094	258.227
3.103	209.076
3.103	217.267
4.061	287.726
4.071	304.851
4.080	273.572
4.100	231.119
4.100	242.289
4.100	248.992
4.100	255.694
4.100	263.885
4.100	332.396];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WelsWieg2017';
comment.tL = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Males guards nest';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43539'; % Cat of Life
metaData.links.id_ITIS = '550562'; % ITIS
metaData.links.id_EoL = '207898'; % Ency of Life
metaData.links.id_Wiki = 'Micropterus_dolomieu'; % Wikipedia
metaData.links.id_ADW = 'Micropterus_dolomieu'; % ADW
metaData.links.id_Taxo = '45141'; % Taxonomicon
metaData.links.id_WoRMS = '151296'; % WoRMS
metaData.links.id_fishbase = 'Micropterus-dolomieu'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropterus_dolomieu}}';
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
bibkey = 'WelsWieg2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jzo.12454}, ' ...
'author = {D. P. Welsh and D. D. Wiegmann and L. M. Angeloni and S. P. Newman and J. G. Miner and J. R. Baylis}, ' ... 
'year = {2017}, ' ...
'title = {Condition-dependent reproductive tactics in male smallmouth bass: evidence of an inconsistent birthdate effect on early growth and age at first reproduction}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {302}, ' ...
'pages = {244--251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Micropterus-dolomieu.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Micropterus_dolomieu/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

