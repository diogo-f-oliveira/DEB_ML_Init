function [data, auxData, metaData, txtData, weights] = mydata_Christinus_marmoratus
%% set metadata
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Gekkonidae';
metaData.species    = 'Christinus_marmoratus';
metaData.species_en = 'Marbled gecko';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Wde'; 't-JOe'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};  
metaData.date_subm = [2019 05 31];
metaData.email    = {'bas.kooijman@vu.nl'};  
metaData.address  = {'VU University Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2019 05 31];

%% set data
% zero-variate data;
data.ab = 81.4;     units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'ThomRuss1999';
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '79 to 84 d; eggs are laid in embryo stage 26/27-29';
data.am = 12.8*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 3;      units.Lp  = 'cm';    label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'guess';
data.Li  = 5.3;    units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Kear2019';

data.Ww0 = 0.628;  units.Ww0 = 'g';   label.Ww0 = 'wet weight at birth';     bibkey.Ww0 = 'ThomRuss1999';
data.Wwb = 0.473;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ThomRuss1999';

data.Ri  = 1.75/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ThomRuss1999';
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 (26 percent) or 2 (74 percent eggs per clutch';

% uni-variate data
% time-weight
data.tW = [ ... % age (d), dry weight (mg)
0.002	1.563
1.169	1.563
2.922	2.083
7.159	2.083
9.935	2.604
15.049	3.646
22.208	7.292
27.760	9.375
28.782	9.896
31.558	10.938
32.435	10.417
32.727	14.583
38.571	15.104
44.708	17.708
45.000	20.833
50.406	22.917
50.698	27.083
51.575	30.208
55.812	32.813
55.813	36.458
58.588	33.333
61.656	53.646
65.601	57.292
65.893	75.000
68.669	68.229
68.815	78.646
72.175	79.688
73.929	110.417
74.804	102.604
74.805	104.167
74.806	108.333
76.558	99.479
77.727	96.354
78.895	117.708
78.896	120.313
79.918	180.729
79.919	179.167
80.794	113.021
80.795	139.063
80.796	151.042
80.797	162.500
81.088	141.146
81.671	94.792
81.672	110.417
82.110	170.833
82.987	136.979
83.133	158.854
83.571	114.583];
units.tW  = {'d', 'mg'};  label.tW = {'time since birth', 'yolk-free embryo dry mass'};  
temp.tW   = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ThomRuss1999';
comment.tW = 'Embryo data';

% time-O2 consumption
data.tJO = [ ... % age (d), O2 consumption (muL/h) 
0.002	0.669
1.944	0.446
2.964	0.484
3.881	0.298
4.596	0.410
5.823	0.596
6.843	0.596
7.759	0.411
8.779	0.355
9.699	0.467
11.741	0.616
12.863	0.597
13.582	1.007
14.600	0.821
15.724	0.970
16.743	0.803
17.665	1.193
18.576	0.450
19.602	0.952
20.725	1.008
21.748	1.268
22.765	0.971
23.687	1.269
25.013	1.288
25.836	1.920
26.851	1.418
27.780	2.385
28.796	2.013
29.819	2.292
30.841	2.441
31.964	2.423
32.782	2.646
33.905	2.684
34.929	3.056
36.052	3.056
36.967	2.703
37.891	3.335
38.911	3.279
39.729	3.428
40.948	2.852
41.869	3.150
42.897	3.894
43.915	3.615
44.835	3.782
45.856	3.857
46.983	4.322
47.899	4.043
48.922	4.360
49.938	3.895
50.762	4.657
51.988	4.843
53.013	5.271
54.033	5.216
54.953	5.327
56.065	4.361
56.894	5.569
57.920	6.127
59.047	6.555
60.059	5.737
60.980	6.016
62.110	6.797
63.032	7.095
64.051	7.002
65.075	7.300
65.998	7.746
67.133	8.973
68.140	7.728
68.965	8.527
70.192	8.769
71.106	8.360
72.031	9.011
72.954	9.513
74.066	8.417
75.094	9.160
76.214	8.938
77.134	9.068
78.157	9.366
78.967	8.790
80.187	8.344
81.115	9.236
82.332	8.493];
units.tJO  = {'d', 'muL/h'};  label.tJO = {'age', 'O2 consumption'};  
temp.tJO   = C2K(25);  units.temp.tJO = 'K'; label.temp.tJO = 'temperature';
bibkey.tJO = 'ThomRuss1999';
comment.tJO = 'Embryo data';

% length-weight
data.LW = [ ... % SVL (mm), wet weight (g)
40.00 1.2
42.00 1.3
38.00 1.5
42.50 1.5
46.00 2
46.00 2.8
49.00 2.5
49.00 2.7
49.00 3.4
50.00 2.5
50.00 2.8
50.00 2.8
50.00 3
50.00 3
50.00 3
51.00 2
53.00 2.9
53.00 3.5
54.00 3
55.00 3.4
55.00 3.4
55.00 3.4
55.00 3.5
56.00 3.6
56.00 3.6
57.00 3.4
57.00 4.2
57.00 4.4
57.00 4.4
57.00 4.5
58.00 3.6
60.00 4.7
60.00 4.9
31.00 0.7
38.00 1
39.00 1.4
46.00 2.2
46.00 2.4
46.00 2.5
46.00 2.5
46.00 2.5
48.00 2.1
48.00 2.6
49.00 2.6
50.00 2.8
50.00 2.9
50.00 3
50.00 3
50.00 3.1
53.00 2.8
53.00 2.8];
data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW = 'Kear2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.tJO = 10 * weights.tJO;
weights.Li = 3 * weights.Li;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;
data.psd.k = 0.6; units.psd.k  = '-';  label.psd.k = 'maintenance ratio';  
weights.psd.k = 5;

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5YGSY'; % Cat of Life
metaData.links.id_ITIS = '818185'; % ITIS
metaData.links.id_EoL = '795383'; % Ency of Life
metaData.links.id_Wiki = 'Christinus_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Christinus_marmoratus'; % ADW
metaData.links.id_Taxo = '90809'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Christinus&species=marmoratus'; % ReptileDB
metaData.links.id_AnAge = 'Christinus_marmoratus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Christinus_marmoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S. A. L. M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomRuss1999'; type = 'Article'; bib = [ ...  % 
'author = {Michael B. Thompson and Kylie J. Russell}, ' ...
'title = {GROWTH AND ENERGETICS OF EMBRYOS OF THE GECKO, \emph{Phyllodactylus marmoratus}, A SPECIES WITH HARD-SHELLED EGGS}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {9}, ' ...
'pages = {37-42}, ' ...
'year = {1999}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Christinus_marmoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Christinus_marmoratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2019'; type = 'Misc'; bib = ...
'note = {Data by Mike Kearney, pers comm}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

