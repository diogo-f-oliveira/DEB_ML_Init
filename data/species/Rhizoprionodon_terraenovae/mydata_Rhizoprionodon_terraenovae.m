function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_terraenovae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_terraenovae'; 
metaData.species_en = 'Atlantic sharpnose shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 06];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 01 06];


%% set data
% zero-variate data

data.ab = 10.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10 to 11 mnth';
data.tp = 3 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 35;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '29 to 37 cm';
data.Lp  = 87;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '85 to 90 cm';
data.Li  = 110;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 7.3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'varies between 1 and 7 pups per yr';

% uni-variate data
 
% time-length data post birth
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	41.447
2.005	84.031
2.005	82.584
2.959	78.243
2.959	83.824
3.007	87.132
3.007	90.439
3.031	97.881
4.010	92.713
4.010	93.747
4.033	85.478
4.988	89.406
4.988	97.054
5.967	101.395
6.014	84.238
6.014	95.607
7.041	93.540
7.995	94.574];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'ThorSimp2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Preferred temp 23.4 - 28 C, mean 27 C; Marine; brackish; demersal; depth range usually 0 - 10 m ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Placental viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4SDDS'; % Cat of Life
metaData.links.id_ITIS = '160200'; % ITIS
metaData.links.id_EoL = '46559819'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_terraenovae'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_terraenovae'; % ADW
metaData.links.id_Taxo = '106463'; % Taxonomicon
metaData.links.id_WoRMS = '158510'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-terraenovae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_terraenovae}}';
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
bibkey = 'ThorSimp2009'; type = 'Article'; bib = [ ... 
'author = {James T. Thorson and Colin A. Simpfendorfer}, ' ... 
'year = {2009}, ' ...
'title = {Gear selectivity and sample size effects on growth curve selection in shark age and growth studies}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {98}, ' ...
'pages = {75-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhizoprionodon-terraenovae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

