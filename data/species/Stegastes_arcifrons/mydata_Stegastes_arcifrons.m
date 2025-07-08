function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_arcifrons

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_arcifrons'; 
metaData.species_en = 'Island major'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(24.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MeekAcke2001';   
  temp.am = C2K(24.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 2.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02089*Lp^2.98, see F1';
data.Wwi = 43.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.98, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.784	4.900
0.923	7.715
1.047	6.906
1.054	8.525
1.176	7.330
1.361	5.904
1.757	9.183
1.823	9.684
2.966	9.303
3.032	9.650
3.103	11.424
3.156	8.956
3.160	9.959
4.051	9.962
4.056	11.080
5.071	10.389
5.133	9.965
5.136	10.698
5.137	10.968
6.090	10.585
6.153	10.316
6.982	10.743
6.983	11.051
7.939	11.517
7.998	10.399
8.000	10.746
8.824	10.016
9.144	10.557
9.147	11.097
9.902	9.210
10.037	10.868
10.099	10.444
10.924	10.100
10.987	9.985
10.989	10.332
11.050	9.831
11.053	10.525
11.056	11.065
11.057	11.373
11.947	11.068
12.006	9.949
12.007	10.297
12.008	10.451
12.008	10.605
12.070	10.104
12.136	10.760
12.836	10.646
12.961	10.223
12.962	10.454
12.964	10.801
13.092	10.994
13.856	11.074
13.917	10.419
13.917	10.611
14.042	9.956
14.048	11.422
14.109	10.882
14.935	10.422
15.003	11.463
15.004	11.733
15.061	10.230
15.063	10.654
15.068	11.926
15.892	11.158
15.952	10.078
16.018	10.850
16.971	10.274
16.973	10.891
17.162	10.468
17.927	10.817
18.054	10.548
18.944	10.551
18.947	11.245
19.011	11.129
19.013	11.631
21.870	10.136
21.936	10.792
21.998	10.407
22.001	11.139
22.126	10.561
22.892	11.065
23.017	10.603
23.078	9.909
24.927	10.648
24.994	11.458
26.008	10.613
27.093	11.272
30.082	10.896];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'Galapagos'};  
temp.tL    = C2K(24.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeekAcke2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_G','tL_P'}; subtitle1 = {'Data from Galapagos, Panama'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNMQ'; % Cat of Life
metaData.links.id_ITIS = '615350'; % ITIS
metaData.links.id_EoL = '46572326'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_arcifrons'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_arcifrons'; % ADW
metaData.links.id_Taxo = '188065'; % Taxonomicon
metaData.links.id_WoRMS = '276662'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-arcifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_arcifrons}}';
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
bibkey = 'MeekAcke2001'; type = 'Article'; bib = [ ... 
'doi = {10.3354/MEPS212223}, ' ...
'author = {M. G. Meekan and J. L. Ackerman and G. M. Wellington}, ' ... 
'year = {2001}, ' ...
'title = {Demography and age structures of coral reef damselfishes in the tropical eastern {P}acific {O}cean}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {212}, ' ...
'pages = {223–232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes_arcifrons.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
