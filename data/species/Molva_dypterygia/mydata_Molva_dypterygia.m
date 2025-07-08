function [data, auxData, metaData, txtData, weights] = mydata_Molva_dypterygia
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Molva_dypterygia'; 
metaData.species_en = 'Blue ling'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % in K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.tp = 11*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female';        bibkey.tp = 'fao'; 
  temp.tp = C2K(5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for male';        bibkey.tpm = 'fao'; 
  temp.tpm = C2K(5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 88;   units.Lp = 'cm';   label.Lp = 'total length at puberty for female';      bibkey.Lp = 'fao';
data.Lpm = 75;   units.Lpm = 'cm';   label.Lpm = 'total length at puberty for male';      bibkey.Lpm = 'fao';
data.Li = 155;    units.Li = 'cm';   label.Li = 'ultimate total length for female';        bibkey.Li = 'fao';
data.Lim = 115;   units.Lim = 'cm';  label.Lim = 'ultimate total length for male';        bibkey.Lim = 'fao';

data.Wwb = 5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 1 mm of M. molva: 4/3*pi*0.05^3';
data.Wwp = 2.4e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on  0.00191 * Lp^3.149, see F4';
data.Wwi = 16.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'AnAge';     

data.Ri = 5e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
2.945	41.201
2.978	43.424
2.978	45.646
3.044	54.537
4.004	52.900
4.004	57.345
4.004	60.123
4.930	55.707
4.963	67.930
4.963	70.152
4.963	73.486
4.963	76.263
4.963	78.486
4.996	59.042
4.996	62.375
4.996	65.153
5.029	82.376
5.956	73.516
5.956	76.849
5.956	79.072
5.956	81.294
5.956	85.183
5.956	87.961
5.989	67.962
5.989	70.739
5.989	95.184
6.949	80.213
6.949	87.991
6.949	90.769
6.949	96.880
6.949	99.658
6.982	82.437
6.982	85.214
7.941	88.577
7.941	105.800
8.967	88.609
8.967	108.609
8.967	111.387
9.926	90.861
11.912	119.811
11.945	123.145
12.904	124.286
13.963	120.986
16.974	137.190];
data.tL(:,1) = 365 * (.75+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 5 * weights.Lp;
weights.Wwb = 5 * weights.Wwb;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Preferred temperature 5 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00191 * (L in cm)^3.149';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '43YS9'; % Cat of Life
metaData.links.id_ITIS = '164761'; % ITIS
metaData.links.id_EoL = '46564467'; % Ency of Life
metaData.links.id_Wiki = 'Molva_dypterygia'; % Wikipedia
metaData.links.id_ADW = 'Molva_dypterygia'; % ADW
metaData.links.id_Taxo = '180273'; % Taxonomicon
metaData.links.id_WoRMS = '126459'; % WoRMS
metaData.links.id_fishbase = 'Molva-dypterygia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Molva_dypterygia}}';
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
bibkey = 'Magn2007'; type = 'article'; bib = [ ...
'author = {E. Magnussen}, ' ... 
'year   = {2007}, ' ...
'title  = {Interpopulation comparison of growth patterns of 14 fish species on {F}aroe {B}ank: are all fishes on the bank fast-growing?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {453-475}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Molva-dypterygia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Molva_dypterygia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2221/en}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
