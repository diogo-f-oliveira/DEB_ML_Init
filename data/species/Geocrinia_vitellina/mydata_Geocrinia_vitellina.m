function [data, auxData, metaData, txtData, weights] = mydata_Geocrinia_vitellina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Geocrinia_vitellina'; 
metaData.species_en = 'Orange-bellied frog'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bFp', 'biTg', 'biTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wdh'; 'Wwh'; 'Wdb'; 'Wwb'; 'E0'; 'Eh'; 'Eb'; 'Ri'}; 
metaData.data_1     = {'t-WdYe'; 't-WdVe'; 't-JOe'}; 

metaData.COMPLETE = 3.3; % using criteria of LikaKear2011

metaData.author   = {'Casey Mueller'; 'Starrlight Augustine'; 'Bas Kooijman'};    
metaData.date_subm = [2011 06 22];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvanplan, Tromso'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 21];


%% set data
% zero-variate data

data.ah = 25;        units.ah = 'd';  label.ah = 'age at hatch';           bibkey.ah = 'MuelAugu2012';   
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 87;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'MuelAugu2012';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2.5*365;   units.ap = 'd';  label.ap = 'age at puberty';         bibkey.ap = 'MuelAugu2012';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;     units.am = 'd';  label.am = 'life span';              bibkey.am = 'MuelAugu2012';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.25;   units.L0  = 'cm'; label.L0  = 'diameter of ovum';      bibkey.L0  = 'MuelAugu2012';  
data.Lh  = 0.43;    units.Lh  = 'cm'; label.Lh  = 'total length at hatch'; bibkey.Lh  = 'MuelAugu2012';  
data.Lb  = 0.58;    units.Lb  = 'cm'; label.Lb  = 'total length at birth'; bibkey.Lb  = 'MuelAugu2012';  
data.Li  = 2.45;    units.Li  = 'cm'; label.Li  = 'ultimate total length'; bibkey.Li  = 'MuelAugu2012';

data.Wdh = 0.0053;  units.Wdh = 'g';  label.Wdh = 'dry weight at hatch';   bibkey.Wdh = 'MuelAugu2012';
data.Wwh = 0.0123;  units.Wwh = 'g';  label.Wwh = 'wet weight at hatch';   bibkey.Wwh = 'MuelAugu2012';
data.Wdb = 0.0038;  units.Wdb = 'g';  label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'MuelAugu2012';
data.Wwb = 0.0208;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MuelAugu2012';

data.E0 = 144;      units.E0 = 'J';   label.E0 = 'energy in egg';          bibkey.E0 = 'MuelAugu2012';
data.Eh = 127;      units.Eh = 'J';   label.Eh = 'energy at hatch';        bibkey.Eh = 'MuelAugu2012';
data.Eb = 88;       units.Eb = 'J';   label.Eb = 'energy at birth';        bibkey.Eb = 'MuelAugu2012';

data.Ri  = 30/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MuelAugu2012';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% age-stage data for conversion of stage to age
as = [ ... % age (d), stage (0 till 37]
0.91	8.98
1.81	10.17
1.94	11.99
2.72	11.99
3.96	13.99
4.03	11.42
4.05	12.93
4.67	17.13
4.70	11.98
4.76	16.25
4.87	16.00
5.88	16.81
5.89	17.51
6.99	17.50
7.09	16.87
7.97	17.00
8.87	18.06
9.99	19.06
10.08	17.99
10.76	19.00
10.86	20.13
11.87	18.80
11.88	19.56
12.98	20.12
13.08	18.99
13.85	18.99
13.98	20.05
14.84	19.17
14.86	20.11
15.96	20.05
15.98	21.05
17.08	20.98
17.09	22.11
17.95	20.10
18.09	21.99
19.08	21.98
19.09	22.92
20.15	20.03
20.19	22.92
20.86	23.04
21.85	23.04
21.86	23.92
23.98	24.98
24.97	24.98
27.17	25.03
28.18	25.85
29.84	26.09
29.94	25.46
30.83	26.02
31.93	25.89
33.16	27.02
33.93	26.96
34.92	26.89
36.04	27.95
37.03	27.95
39.15	29.01
39.82	29.57
40.92	29.51
41.81	29.88
43.03	30.32
44.35	30.31
45.68	30.87
45.91	31.31
46.79	31.31
51.12	32.99
51.89	32.92
53.10	32.92
54.09	32.92
54.65	33.17
54.85	31.97
56.06	31.84
56.08	33.03
59.74	34.15
60.16	32.89
62.95	34.90
63.91	32.88
65.81	34.89
67.22	32.81
70.78	34.81
75.98	35.86
78.84	35.85
84.93	36.95
85.14	36.33
88.00	35.88];
aS = knot([0 10 20 30 50 90], as); % get knots for spline
Sa = aS(:,[2 1]);

% age-yolk data
sY = [ ... % stage, mg yolk dry mass
6.92	4.20
6.93	4.51
6.94	4.60
6.941	5.01
6.95	5.31
6.951	5.88
6.96	6.09
6.961	6.32
6.99	5.13
9.96	5.10
9.97	5.79
10.97	4.01
10.971	4.10
10.98	4.79
10.99	5.11
10.991	5.61
11.04	5.91
11.96	4.58
11.98	6.09
11.981	6.40
11.99	4.00
12.01	5.28
12.02	5.86
13.97	5.57
16.05	4.97
18.92	3.66
19.01	3.99
19.95	4.28
19.951	4.38
19.96	4.77
19.98	3.20
19.981	3.30
22.98	4.34
22.981	4.44
22.982	4.58
23.95	4.37
23.96	4.86
23.961	5.00
24.93	4.32
24.931	4.46
24.94	4.74
24.95	2.35
24.96	3.60
24.98	4.86
24.981	4.97
25.00	2.68
28.91	3.06
28.95	2.86
28.96	3.37
30.94	2.26
30.95	2.38
30.96	2.95
30.99	2.06
31.01	3.37
31.92	1.78
31.921	2.29
31.96	1.66
31.961	2.06
32.00	1.57
32.01	1.97
32.41	2.05
32.44	1.48
32.45	1.76
32.50	2.17
32.93	1.38
32.931	1.51
32.94	2.18
32.98	1.70
32.99	2.35
32.991	2.45
33.00	2.69
33.001	3.19
34.87	0.47
34.92	0.87
34.93	1.19
34.97	0.66
34.971	0.96
34.972	1.07
35.94	0.48
35.941	0.68
36.87	0.36
36.92	0.69
36.96	0.45
36.961	0.57];
data.aWY = sY; data.aWY(:,1) = spline(sY(:,1),Sa);
units.aWY   = {'d', 'mg'};  label.aWY = {'age', 'dry yolk mass'};  
temp.aWY    = C2K(15);  units.temp.aWY = 'K'; label.temp.aWY = 'temperature';
bibkey.aWY = 'Mitc2001';

sV = [ ... stage, mg body dry mass
16.04	0.32
18.94	0.83
19.02	0.29
20.00	0.40
20.01	0.56
20.06	0.94
20.061	1.03
22.99	0.69
22.991	0.90
23.07	0.41
24.01	0.72
24.02	0.83
24.021	1.02
24.95	0.92
24.951	1.02
24.952	1.11
24.96	1.20
24.961	1.43
24.962	1.55
28.96	1.29
29.00	0.99
29.001	1.13
30.98	2.43
30.99	2.61
31.01	1.51
31.02	1.83
31.021	2.02
31.96	2.50
31.961	2.58
31.97	2.70
31.971	2.81
32.01	2.43
32.45	2.40
32.451	2.52
32.452	2.64
32.50	2.71
32.501	2.83
32.89	2.14
32.94	2.04
32.941	2.22
32.942	2.43
32.99	2.71
32.991	2.90
32.992	2.99
33.03	2.32
33.031	2.55
35.00	3.01
35.01	4.03
35.05	3.28
35.051	3.50
35.052	3.64
35.94	3.31
35.97	2.72
37.05	3.11
37.051	3.20
37.052	3.31
37.053	3.49
37.054	3.59
37.055	3.70
37.09	2.90];
data.aWV = sV; data.aWV(:,1) = spline(sV(:,1),Sa);
units.aWV   = {'d', 'mg'};  label.aWV = {'age', 'dry body mass'};  
temp.aWV    = C2K(15);  units.temp.aWV = 'K'; label.temp.aWV = 'temperature';
bibkey.aWV = 'Mitc2001';

% age-respiration data
data.aJO = [ ... % age (d), V_O2 (muL/h)
2.39 0.22
3.08 0.17
3.081 0.17
3.22 0.30
3.57 0.25
3.93 0.29
5.11 0.33
6.17 0.34
7.10 0.26
7.11 0.35
9.96 0.53
9.99 0.66
12.07 0.47
12.21 0.62
13.08 0.86
13.14 0.57
13.16 0.68
16.15 0.98
16.23 0.75
17.31 0.89
18.11 0.76
18.15 0.97
19.12 1.17
19.21 0.99
20.06 1.15
22.12 1.48
22.15 1.02
22.17 1.15
23.99 1.44
25.17 1.46
30.20 2.01
30.38 1.72
32.20 2.05
34.16 1.81
35.17 2.24
36.48 2.32
39.36 2.68
41.31 2.39
42.34 2.89
44.43 2.78
46.19 2.75
47.48 2.72
51.29 3.70
52.28 2.65
53.42 3.09
54.24 3.09
55.28 3.68
56.10 3.63
60.41 4.75
64.44 4.98
67.45 4.72]; 
units.aJO  = {'d', 'muL/h'}; label.aJO = {'age', 'O2 consumption'};  
temp.aJO   = C2K(15); units.temp.aJO = 'K'; label.temp.aJO = 'temperature';
bibkey.aJO = 'Mitc2001';

aJO_extra = [ ...
46.34 2.95
46.36 2.36
55.31 3.18
56.16 2.64
56.46 3.01
60.32 4.24
63.44 4.62
66.22 3.73
66.23 3.12
71.55 3.33
76.50 3.38
79.36 3.63
85.41 3.31
85.58 2.94];

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Results of this entry are reported in MuelAug2012';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'metamorphosis is at birth; between hatch and birth, the tadpole stays in the egg mass';
metaData.bibkey.F1 = 'Mitc2001'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FP6N'; % Cat of Life
metaData.links.id_ITIS = '664682'; % ITIS
metaData.links.id_EoL = '1019811'; % Ency of Life
metaData.links.id_Wiki = 'Geocrinia_vitellina'; % Wikipedia
metaData.links.id_ADW = 'Geocrinia_vitellina'; % ADW
metaData.links.id_Taxo = '78940'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Geocrinia+vitellina'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geocrinia_vitellina}}';
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
bibkey = 'Mitc2001'; type = 'Article'; bib = [ ... 
'author = {Mitchell, N. J.}, ' ... 
'year = {2001}, ' ...
'title = {The Energetics of Endotrophic Development in the Frog \emph{Geocrinia vitellina} ({A}nura: {M}yobatrachinae)}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {74}, ' ...
'number = {6}, '...
'pages = {832-842}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dris1999'; type = 'Article'; bib = [ ... 
'author = {Driscoll, D. A.}, ' ... 
'year = {1999}, ' ...
'title = {Skeletochronological assessment of age structure and population stability for two threatened frog species}, ' ...
'journal = {Australian Journal of Ecology}, ' ...
'volume = {24}, ' ...
'pages = {182-189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gosn1960'; type = 'Article'; bib = [ ... 
'author = {Gosner K. L.}, ' ... 
'year = {1960}, ' ...
'title = {A simplified table for staging anuran embryos and larvae with notes on identification}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {16}, ' ...
'pages = {183-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuelAugu2012'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. and Augustine, S. and Kooijman, S. A. L. M. and Kearney, M. and Seymour, R.}, ' ... 
'year = {2012}, ' ...
'title = {The tradeoff between maturation and growth during accelerated development of frogs}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/4ZMA4WX3/item-details}}, '...
'volume = {163}, ' ...
'pages = {103--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
