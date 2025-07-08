function [data, auxData, metaData, txtData, weights] = mydata_Noturus_stigmosus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_stigmosus'; 
metaData.species_en = 'Northern madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 10 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 10 12]; 

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Sche2003';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on at least 3 yr';

data.Lp  = 3.7/0.84;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Sche2003';
  comment.Lp = 'Based on SL 3.7 cm, see F2';
data.Li  = 13;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 1.36e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Sche2003'; 
  comment.Wwb = 'based on egg diameter of 3.1 mm: pi/6*0.31^3';
   
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm)
12.516	1.497
12.545	1.315
12.561	1.216
12.576	1.117
24.705	4.235
24.723	4.120
25.933	4.450
26.014	3.939
26.032	3.823
26.063	3.625
26.313	2.042
26.329	1.943
27.518	2.405
27.536	2.289
27.549	2.207
27.560	2.141
27.620	1.761
28.598	3.559
28.606	3.510
28.632	3.345
43.860	2.818
43.883	2.669
43.896	2.587
88.878	5.459
88.974	4.849
88.992	4.734
89.054	4.338
89.073	4.222
89.083	4.156
89.148	3.744
90.366	4.024
90.392	3.860
103.114	3.217
103.200	2.673
120.593	4.422
120.619	4.257
120.765	3.333
122.094	2.905
123.190	3.960
123.211	3.828
123.224	3.746
123.245	3.614
149.620	4.424
149.633	4.341
149.646	4.259
149.659	4.176
149.678	4.061
149.691	3.978
149.701	3.912
150.825	4.787
150.851	4.622
150.867	4.523
150.976	3.830
152.251	3.747
152.267	3.648
152.277	3.582
361.430	5.804
361.477	5.507
361.493	5.408
361.623	4.583
361.638	4.485
362.770	5.309
362.788	5.194
362.807	5.078
362.817	5.012
362.835	4.897
362.859	4.748
362.872	4.666
362.921	4.353
377.876	5.558
377.891	5.459
377.910	5.343
379.219	5.046
379.234	4.947
424.439	6.401
425.915	5.049
425.930	4.950
427.023	6.022
437.468	3.812
438.707	3.961
439.813	4.951
439.899	4.406
452.353	5.463
456.293	4.490
512.700	6.934
515.271	6.637
517.873	6.142
725.832	7.935
725.850	7.820
725.863	7.737
725.897	7.523
725.910	7.440
725.923	7.358
725.967	7.077
725.977	7.011
725.991	6.929
726.974	8.694
726.998	8.545
727.011	8.463
727.284	6.731
727.362	6.236
728.465	7.242
728.577	6.533
728.637	6.154
728.676	5.906
728.694	5.791
728.715	5.659
743.607	7.260
743.636	7.078
744.812	7.623
746.173	6.996
746.186	6.914
758.939	6.073
758.960	5.941
790.363	6.883
790.428	6.471
790.483	6.124
790.496	6.042
790.538	5.778
801.737	6.785
803.052	6.455
804.405	5.878
804.415	5.812
804.428	5.729
805.563	6.537
819.411	6.753
820.783	6.060
821.946	6.687
821.951	6.654];
data.tL(:,2) = data.tL(:,2)/ 0.84; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sche2003';
comment.tL = 'Data from Moore''s Ferry';

% length - weight
data.LWw_f = [ ... % std length (cm), wet weight (g)
3.523	0.726
3.722	0.835
3.833	0.921
3.833	0.794
3.920	1.133
3.920	0.922
3.920	0.838
4.039	0.924
4.118	1.010
4.118	0.820
4.253	1.350
4.753	1.780
4.943	2.395
4.990	2.185
5.093	2.672
5.117	2.504
5.196	2.716
5.283	2.929
5.291	3.287
5.395	2.635
5.529	3.080
5.688	3.062
5.696	2.682
5.759	4.076
5.791	3.043
5.823	3.549
5.837	5.702
5.871	2.052
5.941	4.416
5.997	3.742
6.124	3.660
6.203	4.421
6.203	4.315
6.402	4.023
6.584	4.596
6.679	4.766
6.908	5.783
6.956	5.615
7.186	5.788
7.196	3.657
7.305	6.169
7.353	5.221
7.526	6.701];
data.LWw_f(:,1) = data.LWw_f(:,1)/ 0.84; % convert SL to TL
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'Sche2003';
comment.LWw_f = 'Data for females from Moore''s Ferry';
%
data.LWw_m = [ ... % std length (cm), wet weight (g)
4.102	1.010
4.420	1.416
4.522	1.671
4.602	1.841
4.704	2.518
4.784	2.055
4.887	1.973
4.887	1.846
5.117	2.314
5.299	3.013
5.458	2.889
5.506	3.059
5.989	3.257
6.005	3.405
6.107	5.558
6.148	3.555
6.393	5.036
6.504	4.742
6.671	5.167
6.995	5.953
7.391	7.943
7.518	7.397
7.819	8.288
7.841	10.081];
data.LWw_m(:,1) = data.LWw_m(:,1)/ 0.84; % convert SL to TL
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'Sche2003';
comment.LWw_m = 'Data for males from Moore''s Ferry';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
    5.8 34
    5.8 76
    5.9 81
    6.2 82
    6.9 86
    6.9 83
    7.2 66
    7.3 71
    7.3 92
    7.5 98];
data.LN(:,2) = data.LN(:,2)/ 0.84; % convert SL to TL
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Sche2003';
comment.LN = 'Data from Moore''s Ferry';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZN9'; % Cat of Life
metaData.links.id_ITIS = '164025'; % ITIS
metaData.links.id_EoL = '208745'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_stigmosus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_stigmosus'; % ADW
metaData.links.id_Taxo = '181584'; % Taxonomicon
metaData.links.id_WoRMS = '1013249'; % WoRMS
metaData.links.id_fishbase = 'Noturus-stigmosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_stigmosus}}';
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
bibkey = 'Sche2003'; type = 'phdthesis'; bib = [ ...  
'author = {Jonathan F. Scheibly}, ' ...
'year = {2003}, ' ...
'title = {Life history of the northern madtom, \emph{Noturus stigmosus} ({S}iluriformes: {I}ctaluridae), in the Licking River, Kentucky}, ' ... 
'school = {Morehead State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-stigmosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

