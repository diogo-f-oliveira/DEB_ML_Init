  function [data, auxData, metaData, txtData, weights] = mydata_Pimelodella_kronei
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Heptapteridae';
metaData.species    = 'Pimelodella_kronei'; 
metaData.species_en = 'Blind catfish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFcc'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'L-dL'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 10];

%% set data
% zero-variate data
data.ab = 10; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty';   bibkey.Lp = 'guess';
data.Li = 20.2;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*.13^3';
data.Wwp = 7.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00832*Lp^2.97, see F1';
data.Wwi = 62.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^2.97, see F1';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'AmarAran1998';
  temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on value for Pimelodella pappenheimi';

% uni-variate data
% length-change in length
data.LdL = [ ... % length (mm), change in length (cm/d)
7.824	0.008
8.014	0.002
8.162	0.004
8.298	0.082
8.454	0.627
8.903	-0.205
8.972	0.919
9.354	0.178
9.395	0.202
9.408	0.157
9.421	0.157
9.448	0.159
9.475	0.157
9.475	0.161
9.489	0.153
9.489	0.158
9.489	0.161
9.502	0.151
9.516	0.159
9.529	0.157
9.623	0.071
9.650	0.080
9.665	0.236
9.705	0.152
10.176	0.006
10.378	0.002
10.421	0.159
10.422	0.197
10.433	0.051
10.725	-0.330
10.757	0.006
10.798	0.041
10.826	0.133
10.865	0.004
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
10.892	0.000
11.259	0.133
11.286	0.145
11.365	0.004
11.571	0.282
11.582	0.065
11.633	-0.184
11.662	0.004
11.730	0.052
11.784	0.005
11.840	0.137
11.880	0.116
11.905	0.005
11.925	0.441
12.028	0.103
12.203	0.005
12.514	1.043
12.677	0.115
12.753	0.711
12.878	0.004
13.013	-0.019
13.099	0.326
13.103	-0.355
13.120	-0.128
13.124	0.152
13.162	0.002
13.230	0.028
13.261	-0.659
13.490	-0.738
13.501	0.071
13.514	0.002
13.622	0.053
13.636	0.082
13.758	0.079
13.911	0.377
13.937	0.372
14.149	0.006
14.176	0.010
14.189	0.005
14.258	0.063
14.324	0.007
14.369	0.326
14.729	-0.036
14.742	-0.065
15.029	0.139
15.122	0.003
15.124	0.207
15.231	0.100
15.595	0.003
16.135	0.026];
data.LdL(:,2) = data.LdL(:,2)/10; % comvert mm to cm
units.LdL = {'cm', 'cm/d'};  label.LdL = {'total length', 'change in total length'};  
temp.LdL = C2K(19);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Traj1991';
comment.LdL = 'Capture-recapture data from Areias caves';

%% set weights for all real data
weights = setweights(data, []);
%weights.LdL = weights.LdL * 1;
weights.LdL(data.LdL(:,2)<0.02)=0;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'negative values in LdL data are due to measurement errors, according to Traj1991; values below 0.02 cm/d are ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'endemic in caves in the Ribeira do Iguape River basin in Sao Paulo, Brazil';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '77JMW'; % Cat of Life
metaData.links.id_ITIS = '640222'; % ITIS
metaData.links.id_EoL = '1157228'; % Ency of Life
metaData.links.id_Wiki = 'Pimelodella_kronei'; % Wikipedia
metaData.links.id_ADW = 'Pimelodella_kronei'; % ADW
metaData.links.id_Taxo = '183848'; % Taxonomicon
metaData.links.id_WoRMS = '1526124'; % WoRMS
metaData.links.id_fishbase = 'Pimelodella-kronei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pimelodella_kronei}}';  
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
bibkey = 'Traj1991'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf02027984}, ' ...
'author = {Eleonora Trajano}, ' ...
'year = {1991}, ' ...
'title = {Population ecology of \emph{Pimelodella kronei}, troglobitic catfish from Southeastern {B}razil ({S}iluriformes, {P}imelodiae)}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {30(4)}, '...
'pages = {407–421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmarAran1998'; type = 'Article'; bib = [ ...
'doi = {10.1076/snfe.33.2.106.2164}, ' ...
'author = {M. F. Amaral and Jose Marcelo Rocha Aranha and M\''{a}rcia Santos de Menezes}, ' ...
'year = {1998}, ' ...
'title = {Reproduction of the Freshwater Catfish \emph{Pimelodella pappenheimi} in Southern {B}razil}, ' ... 
'journal = {Studies on Neotropical Fauna and Environment}, ' ...
'volume = {33(2)}, '...
'pages = {106-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pimelodella-kronei.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

