function [data, auxData, metaData, txtData, weights] = mydata_Gaidropsarus_guttatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Gaidropsarus_guttatus'; 
metaData.species_en = 'Spotted rockling'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', '0iMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % in K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 15]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 15]; 

%% set data
% zero-variate data
data.tp = 0.8*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'MoraAfon2003'; 
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Based on tL data for Lp';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';  
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.1;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'MoraAfon2003';
data.Li = 32.6;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.1  mm: 4/3*pi*0.055^3';
data.Wwp = 33;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.0108 * Lp^2.959, see F3';
data.Wwi = 324; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.0108 * Li^2.959, see F3';

data.GSI = 5; units.GSI = '-';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'MoraAfon2003';
  temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ total length (cm) 
0.005	0.128
0.074	3.974
0.074	4.487
0.831	15.192
0.909	17.115
0.910	20.577
0.914	17.949
0.914	18.397
0.914	18.526
0.914	19.487
0.918	12.436
0.918	14.359
0.918	15.577
0.918	15.897
0.918	16.282
0.918	17.564
0.923	21.859
0.991	16.282
0.992	21.474
0.992	21.667
0.992	23.013
0.996	19.167
0.996	19.551
0.996	19.679
0.997	23.526
1.000	14.744
1.001	15.769
1.001	16.923
1.084	24.872
1.166	16.795
1.166	19.808
1.326	18.333
1.326	18.590
1.326	19.808
1.326	20.128
1.330	15.513
1.331	20.705
1.331	22.692
1.335	17.051
1.335	17.308
1.335	17.821
1.340	18.846
1.340	19.038
1.495	14.679
1.496	21.474
1.496	21.987
1.496	25.256
1.500	17.564
1.500	19.615
1.500	19.936
1.500	20.321
1.500	20.705
1.500	21.090
1.501	22.949
1.501	23.269
1.504	13.590
1.504	15.769
1.505	18.462
1.505	18.718
1.505	19.103
1.505	19.103
1.505	19.359
1.826	21.346
1.826	21.603
1.831	24.231
1.834	18.333
1.835	19.103
1.835	19.359
1.835	19.615
1.835	20.192
1.835	23.269
1.835	25.000
1.835	25.705
1.836	27.564
1.836	29.359
1.912	19.744
1.913	19.872
1.913	26.795
1.917	16.795
1.917	19.103
1.922	21.474
1.922	24.231
1.923	29.231
2.000	20.385
2.000	23.782
2.087	23.526
2.170	26.795
2.174	20.256
2.334	23.205
2.339	23.974
2.494	21.154
2.582	22.564
2.916	19.615
2.922	32.692
3.008	24.872
3.333	27.244];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraAfon2003';

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
F1 = 'Temperature varies from 17 till 21 C';
metaData.bibkey.F1 = 'MoraAfon2003'; 
F2 = 'Sex differences are small';
metaData.bibkey.F2 = 'MoraAfon2003'; 
F3 = 'Length-Weight relationship for G. vulgaris: W in g = 0.0108 * (L in cm)^2.959';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6JVLJ'; % Cat of Life
metaData.links.id_ITIS = '550697'; % ITIS
metaData.links.id_EoL = '46564456'; % Ency of Life
metaData.links.id_Wiki = 'Gaidropsarus'; % Wikipedia
metaData.links.id_ADW = 'Gaidropsarus_guttatus'; % ADW
metaData.links.id_Taxo = '174631'; % Taxonomicon
metaData.links.id_WoRMS = '126455'; % WoRMS
metaData.links.id_fishbase = 'Gaidropsarus-guttatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gaidropsarus}}';
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
bibkey = 'MoraAfon2003'; type = 'article'; bib = [ ...
'author = {T. Morato and P. Afonso and R. S. Santos and H. M. Krug and R. D. M. Nash}, ' ... 
'year   = {2003}, ' ...
'title  = {The reproduction, age and growth of the spotted rockling}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {1450-1455}, ' ...
'volume = 62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/8427}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

