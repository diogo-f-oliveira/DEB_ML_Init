function [data, auxData, metaData, txtData, weights] = mydata_Octopus_pallidus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_pallidus'; 
metaData.species_en = 'Pale octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 28]; 

%% set data
% zero-variate data

data.am = 350;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'LepoPecl2008';   
  temp.am = C2K(14);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 0.25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LepoPecl2008';
data.Wwp = 173;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
data.Wwi = 1.2e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at 350 d'; bibkey.Wwi = 'LepoPecl2008';

data.Ni  = 197; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'LepoPecl2008';   
  temp.Ni = C2K(14);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-W data
data.tWw_14 = [ ... % time (d), ln wet weight (g)
0.380	-0.849
0.380	-0.849
0.380	-1.014
1.139	-1.205
10.626	-0.630
11.385	-1.041
11.385	-1.041
11.385	-0.795
17.837	-0.795
17.837	-0.630
17.837	-0.356
17.837	-0.274
25.806	-0.192
25.806	-0.329
26.186	-0.658
31.120	-0.137
31.120	-0.027
31.120	-0.438
41.746	0.082
41.746	-0.274
46.300	0.137
46.300	0.329
46.679	-0.356
46.679	-0.137
52.372	0.384
52.372	0.192
53.131	0.027
53.510	-0.247
59.203	-0.247
59.203	0.055
59.203	0.712
65.275	0.767
66.414	0.274
66.414	-0.055
73.624	0.110
74.004	0.466
74.383	0.986
81.973	0.137
82.353	1.123
83.491	0.685
90.323	0.384
90.323	0.658
90.323	0.795
90.323	1.178
92.979	0.767
92.979	0.219
95.256	1.151
100.190	1.233
100.190	1.397
100.949	0.548
100.949	0.877
106.262	1.479
106.262	1.397
106.641	1.178
106.641	1.151
106.641	0.630
114.611	1.151
114.611	1.616
114.611	1.781
114.991	1.014
120.683	1.699
120.683	1.918
121.063	1.205
121.063	1.041
128.273	1.890
128.273	2.082
129.032	1.425
132.068	2.164
132.448	2.027
133.207	1.616
142.315	2.548
142.315	2.384
142.315	1.945
142.694	1.644
144.592	2.685
146.110	2.384
146.490	1.945
146.490	2.055];
n=size(data.tWw_14,1); for i=2:n; if data.tWw_14(i,1)<=data.tWw_14(i-1,1); data.tWw_14(i,1)=data.tWw_14(i-1,1)+1e-8;end;end
data.tWw_14(:,2) = exp(data.tWw_14(:,2)); % remove log transform
units.tWw_14   = {'d', 'g'};  label.tWw_14 = {'time', 'wet weight', '14.7 C'};  
temp.tWw_14    = C2K(14.7);  units.temp.tWw_14 = 'K'; label.temp.tWw_14 = 'temperature';
bibkey.tWw_14 = 'AndrGris2009';
comment.tWw_14 = 'Data at 14.7 C';
%
data.tWw_16 = [ ... % time (d), ln wet weight (g)
0.762	-1.337
0.762	-0.926
0.762	-0.735
9.905	-0.678
10.667	-0.815
10.667	-1.226
16.381	-0.294
16.381	-0.513
17.143	-1.006
24.762	-0.841
25.143	-0.485
25.524	-0.649
30.476	-0.785
31.238	-0.648
31.238	-0.429
40.762	-0.647
40.762	-0.373
41.143	0.038
46.095	-0.591
46.095	-0.317
46.095	-0.043
51.429	-0.180
52.190	0.067
52.571	-0.673
58.667	-0.507
58.667	0.342
59.429	0.095
65.524	-0.369
65.905	0.233
67.429	0.562
73.905	-0.533
74.286	0.344
74.286	0.481
81.905	0.756
82.286	-0.340
82.286	0.647
89.143	-0.037
90.286	0.757
92.571	0.675
92.571	0.867
102.095	0.896
107.048	0.896
107.048	1.170
115.429	1.199
115.810	1.309
121.143	1.282
121.143	1.501
128.762	1.530
129.524	1.804
132.952	1.832
133.333	3.037
142.476	3.367
142.857	2.189
147.048	2.327
147.429	3.423
154.667	3.917];
n=size(data.tWw_16,1); for i=2:n; if data.tWw_16(i,1)<=data.tWw_16(i-1,1); data.tWw_16(i,1)=data.tWw_16(i-1,1)+1e-8;end;end
data.tWw_16(:,2) = exp(data.tWw_16(:,2)); % remove log transform
units.tWw_16   = {'d', 'g'};  label.tWw_16 = {'time', 'wet weight', '16.9 C'};  
temp.tWw_16    = C2K(16.9);  units.temp.tWw_16 = 'K'; label.temp.tWw_16 = 'temperature';
bibkey.tWw_16 = 'AndrGris2009';
comment.tWw_16 = 'Data at 16.9 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_14 = 3 * weights.tWw_14;
weights.tWw_16 = 3 * weights.tWw_16;
weights.Ni = 10 * weights.Ni;
weights.Wwb = 10 * weights.Wwb;
weights.Wwi = 10 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_16','tWw_14'}; subtitle1 = {'Data for 16.9, 14.7 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Male reach similar sizes as females, but mature earlier at a smaller size, 250 g';
metaData.bibkey.F2 = 'LepoPecl2008'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '48KP5'; % Cat of Life
metaData.links.id_ITIS = '556188'; % ITIS
metaData.links.id_EoL = '491716'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_pallidus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_pallidus'; % ADW
metaData.links.id_Taxo = '158274'; % Taxonomicon
metaData.links.id_WoRMS = '342015'; % WoRMS
metaData.links.id_molluscabase = '342015'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_pallidus}}';
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
bibkey = 'AndrGris2009'; type = 'article'; bib = [ ...
'doi = {10.3354/meps07736}, ' ...
'author = {Jessica Andr\''{e} and Eric P. M. Grist and Jayson M. Semmens and Gretta T. Pecl and Susumu Segawa}, ' ... 
'year = {2009}, ' ...
'title = {Effects of temperature on energetics and the growth pattern of benthic octopuses}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {374}, ' ...
'pages = {167-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LepoPecl2008'; type = 'article'; bib = [ ...
'doi = {10.1007/s00227-008-1033-9}, ' ...
'author = {Stephen C. Leporati and Gretta T. Pecl and Jayson M. Semmens}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive status of \emph{Octopus pallidus}, and its relationship to age and size}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {155(4)}, ' ...
'pages = {375-385}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Octopus-pallidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

