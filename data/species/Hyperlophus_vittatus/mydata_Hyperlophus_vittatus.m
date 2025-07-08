function [data, auxData, metaData, txtData, weights] = mydata_Hyperlophus_vittatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Hyperlophus_vittatus'; 
metaData.species_en = 'Sandy sprat';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(18); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 18];

%% set data
% zero-variate data;
data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'RogeWard2007';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 5.8;  units.Lp  = 'cm';  label.Lp  = 'oozoid length at puberty';   bibkey.Lp  = 'RogeWard2007';
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate oozoid length';   bibkey.Li  = 'fishbase';

data.Wwb  = 3.8e-4;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'RogeWard2007';
  comment.Wwi = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwp  = 0.94;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';   bibkey.Wwp  = {'RogeWard2007','fishbase'};
  comment.Wwb = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi  = 44.6;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.R87  = 5600/365; units.R87  = '#/d';label.R87  = 'reprod rate at FL 87 mm'; bibkey.R87  = 'RogeWard2007';   
temp.R87 = C2K(18); units.temp.R87 = 'K'; label.temp.R87 = 'temperature';

% uni-variate data

% time-lengt
data.tL = [ ... % fork length (cm), fork length (cm)
0.148	2.048
0.154	1.706
0.155	2.338
0.166	1.809
0.166	1.997
0.166	2.201
0.202	2.065
0.207	1.928
0.207	2.167
0.208	2.423
0.225	1.706
0.225	2.611
0.243	2.457
0.243	2.594
0.254	1.877
0.260	2.133
0.266	1.997
0.290	1.877
0.302	2.218
0.361	2.150
0.575	6.092
0.593	6.195
0.610	6.280
0.652	6.229
0.693	6.348
0.711	6.331
0.764	6.382
0.770	6.519
0.770	6.587
0.817	6.536
0.888	6.621
1.094	6.689
1.129	6.894
1.135	6.962
1.135	7.474
1.141	6.706
1.141	7.116
1.141	7.253
1.141	7.423
1.247	6.638
1.253	7.167
1.253	7.372
1.259	6.758
1.259	7.287
1.259	7.560
1.265	7.457
1.265	7.696
1.872	6.877
1.872	7.014
1.878	7.201
1.966	7.491
1.972	7.014
1.977	6.672
1.978	6.809
2.060	7.048
2.072	6.877
2.072	7.167
2.084	6.911
2.131	7.884
2.137	7.952
2.243	8.072
2.244	8.362
2.249	7.645
2.249	8.157
2.255	7.901
2.261	8.242
2.261	8.481
2.266	6.655
2.267	7.969
2.873	7.747
2.967	6.689
2.979	6.809
2.980	7.765
2.986	7.969
2.986	8.140
2.991	7.679
3.056	7.713
3.062	7.850
3.132	6.877
3.257	8.771
3.257	9.181
3.262	6.911
3.976	8.498
3.976	8.703
3.980	6.843
3.988	8.874
4.076	8.481];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL = {'d','cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(18); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RogeWard2007'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.R87 = 3 * weights.R87;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: weight in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NQDQ'; % Cat of Life
metaData.links.id_ITIS = '161817'; % ITIS
metaData.links.id_EoL = '46562523'; % Ency of Life
metaData.links.id_Wiki = 'Hyperlophus_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Hyperlophus_vittatus'; % ADW
metaData.links.id_Taxo = '177015'; % Taxonomicon
metaData.links.id_WoRMS = '281096'; % WoRMS
metaData.links.id_fishbase = 'Hyperlophus-vittatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperlophus_vittatus}}'; 
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
bibkey = 'RogeWard2007'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1439-0426.2007.00896.x}, ' ...
'author = {P. J. Rogers and T. M. Ward}, ' ...
'year = {2007}, ' ...
'title  = {Life history strategy of sandy sprat \emph{Hyperlophus vittatus} ({C}lupeidae): a comparison with clupeoids of the {I}ndo-{P}acific and southern {A}ustralia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {23(5)}, '...
'pages = {583–591}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hyperlophus-vittatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
