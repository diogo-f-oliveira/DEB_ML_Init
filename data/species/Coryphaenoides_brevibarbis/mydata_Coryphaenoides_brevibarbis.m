function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_brevibarbis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_brevibarbis'; 
metaData.species_en = 'Shortbeard grenadier'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data

data.am = 25*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'BergHunt2021';   
  temp.am = C2K(3.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 35;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: pi/6*0.26^3';
data.Wwp = 22.8;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00219*Lp^3.20, see F1';
data.Wwi = 191;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.20, see F1';

data.Ri  = 450/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
10.998	4.323
10.999	4.989
11.056	2.489
11.491	3.654
11.863	4.819
11.923	3.986
11.926	5.652
12.046	3.485
12.172	4.818
12.481	5.483
12.602	3.816
13.098	4.814
13.100	5.981
13.101	6.314
13.220	4.480
13.653	4.978
13.778	5.811
14.024	5.143
14.148	5.310
14.212	6.809
14.520	6.308
14.950	4.973
14.953	6.806
15.322	6.305
15.571	7.470
15.939	5.802
15.940	6.469
16.372	6.300
16.555	5.133
16.682	7.299
16.992	7.798
17.114	6.964
17.485	7.462
17.549	8.795
17.605	5.462
17.730	6.461
18.044	9.460
18.162	6.126
18.287	7.292
18.289	8.292
18.600	9.458
18.659	8.291
18.786	10.290
19.336	6.955
19.522	7.454
19.583	7.287
19.648	9.120
20.019	9.119
20.201	7.451
20.451	9.283
20.577	10.783
20.633	7.449
20.946	9.781
21.071	10.781
21.561	8.779
21.625	9.945
22.119	10.110
22.363	8.442
22.553	10.775
22.981	8.439
23.599	8.937];
data.tL(:,1) = 365*(data.tL(:,1)-7); % convert yr to d
data.tL(:,2) = data.tL(:,2)*2.86; % convert PAL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BergHunt2021';
comment.tL = 'PAL was converted to TL using TL=2.86*TL, see F2';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';  
D2 = 'I had to subtract 7 yrs from age estimates to arrive at an acceptable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight Ww in g = 0.00219*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 2.86*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YS2W'; % Cat of Life
metaData.links.id_ITIS = '622865'; % ITIS
metaData.links.id_EoL = '46564513'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_brevibarbis'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_brevibarbis'; % ADW
metaData.links.id_Taxo = '171930'; % Taxonomicon
metaData.links.id_WoRMS = '158954'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-brevibarbis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_brevibarbis}}';
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
bibkey = 'BergHunt2021'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.14801}, ' ...
'author = {Odd Aksel Bergstad and Rebecca H. Hunter and Nicola J.Cousins and David M. Bailey and Terje J{/o}rgensen}, ' ... 
'year = {2021}, ' ...
'title = {Notes on age determination, size and age structure, longevity and growth of co-occurring macrourid fishes}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {99}, '...
'pages = {1032–1043}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaenoides-brevibarbis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

