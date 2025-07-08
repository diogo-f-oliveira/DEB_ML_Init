function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_mediterraneus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_mediterraneus'; 
metaData.species_en = 'Mediterranean grenadier'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
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

data.am = 40*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'BergHunt2021';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 62;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 73;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: pi/6*0.26^3';
data.Wwp = 1.2e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00219*Lp^3.20, see F1';
data.Wwi = 2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.20, see F1';

data.Ri  = 1.6e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
15.089	5.415
15.521	4.414
15.895	5.590
16.016	4.083
16.397	9.446
16.452	5.762
16.893	9.785
18.189	7.283
18.559	6.617
18.808	7.624
19.557	10.644
19.984	6.964
20.173	8.807
20.178	11.654
20.229	5.458
20.542	7.471
20.671	10.486
21.414	10.325
21.725	11.332
21.969	8.990
22.776	10.336
22.779	12.011
22.896	8.328
22.899	9.835
24.512	11.690
25.440	11.363
25.877	13.377
25.931	8.521
25.935	11.033
26.123	12.206
26.676	9.699
27.483	11.213
27.542	9.036
27.989	16.744
28.415	12.895
28.419	14.738
28.598	11.055
29.536	16.422
29.663	18.097
30.088	13.579
30.521	13.415
30.529	17.937
30.588	16.263
31.145	16.100
31.887	15.102
32.446	16.111
32.448	17.283
33.001	15.111
33.558	14.948
34.428	16.630
34.487	14.956
35.049	17.640
35.975	16.141
35.977	16.978
36.413	18.489
36.967	16.986];
data.tL(:,1) = 365*(data.tL(:,1)-8); % convert yr to d
data.tL(:,2) = data.tL(:,2)*3.83; % convert PAL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BergHunt2021';
comment.tL = 'PAL was converted to TL using TL=3.83*TL, see F2';

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
D2 = 'I had to subtract 8 yrs from age estimates to arrive at an acceptable fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight Ww in g = 0.00219*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 3.83*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YS4M'; % Cat of Life
metaData.links.id_ITIS = '622909'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_mediterraneus'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_mediterraneus'; % ADW
metaData.links.id_Taxo = '171961'; % Taxonomicon
metaData.links.id_WoRMS = '183099'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-mediterraneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_mediterraneus}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaenoides-mediterraneus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

