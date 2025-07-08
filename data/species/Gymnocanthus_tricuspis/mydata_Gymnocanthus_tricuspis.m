function [data, auxData, metaData, txtData, weights] = mydata_Gymnocanthus_tricuspis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Gymnocanthus_tricuspis'; 
metaData.species_en = 'Arctic staghorn sculpin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN','MAN','MPN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 30];

%% set data
% zero-variate data

data.am = 15 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(-0.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 3.7e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TokrEmel2022';
  comment.Wwb = 'based on egg diameter of 1.92 mm: pi/6*0.192^3';
data.Wwi = 468; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00741*Li^3.25, see F1'; 

data.Ri = 5414/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-0.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years), total length (cm) 
1	 4.581  4.515
2	 5.438  5.441
3	 7.045  6.979
4	 9.504  9.097
5	12.337 10.330
6	14.250 12.958
7	17.084 NaN];
data.tL_fm(:,1) = 365 * (0.8 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(-0.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TokrEmel2022';  treat.tL_fm = {1 {'male','female'}};

% time-length
data.tW_fm = [ ... % age (years), weight (g) 
1	 1.204  0.874
2	 1.575  1.758
3	 4.508  3.837
4	10.855  8.646
5	26.762 12.774
6	49.328 30.048
7	69.846 NaN];
data.tW_fm(:,1) = 365 * (0.8 + data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(-0.6);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'TokrEmel2022';  treat.tW_fm = {1 {'male','female'}};

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
4.083	1.143
4.565	1.800
4.731	2.127
4.930	2.293
5.063	1.972
5.445	1.818
5.894	2.313
6.210	2.805
6.592	3.298
6.625	5.078
6.791	4.596
6.991	4.762
7.173	5.575
7.273	5.739
7.572	5.745
7.738	9.955
7.988	7.857
8.071	5.917
8.253	7.700
8.519	9.000
8.785	8.844
9.184	10.308
9.516	10.800
9.715	12.422
10.015	14.532
10.064	13.077
10.280	16.317
10.812	19.888
10.829	18.432
10.912	16.492
11.294	21.192
11.394	25.401
11.460	19.092
11.593	22.331
11.626	25.568
11.742	26.865
11.826	20.879
11.942	31.076
11.992	27.193
12.025	23.958
12.108	28.167
12.291	26.390
12.324	21.375
12.341	23.479
12.424	28.820
12.640	26.721
12.806	28.343
12.922	35.303
12.955	32.553
13.022	35.143
13.105	37.734
13.105	27.378
13.105	24.465
13.205	35.956
13.304	28.353
13.387	35.150
13.537	40.008
13.786	47.618
13.969	37.913
14.218	47.789
14.351	50.057
14.650	53.299
15.082	55.735
15.099	50.719
15.165	51.206
15.564	56.877
15.813	63.840
16.444	67.737
17.707	73.102]; 
units.LW_f = {'cm', 'g'}; label.LW_f = {'time since birth', 'weight', 'female'};  
bibkey.LW_f = 'TokrEmel2022';
%
data.LW_m = [ ... % total length (cm), weight (g)
7.738	4.777
8.453	5.277
8.552	6.897
8.752	8.196
8.868	10.949
8.984	5.773
9.084	8.850
9.234	12.251
9.383	8.047
9.782	9.997
9.931	11.618
10.247	11.139
10.380	12.598
10.463	14.217
12.773	31.254
12.906	30.286
13.238	31.264]; 
units.LW_m = {'cm', 'g'}; label.LW_m = {'time since birth', 'weight', 'male'};  
bibkey.LW_m = 'TokrEmel2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.tW_fm = weights.tW_fm * 5;
weights.Wwb = weights.Wwb * 3;
weights.Wwi = weights.Wwi * 3;
weights.Ri = weights.Ri * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00741*(TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6L772'; % Cat of Life
metaData.links.id_ITIS = '167275'; % ITIS
metaData.links.id_EoL = '46568955'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocanthus_tricuspis'; % Wikipedia
metaData.links.id_ADW = 'Gymnocanthus_tricuspis'; % ADW
metaData.links.id_Taxo = '175540'; % Taxonomicon
metaData.links.id_WoRMS = '127198'; % WoRMS
metaData.links.id_fishbase = 'Gymnocanthus-tricuspis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocanthus_tricuspis}}';
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
bibkey = 'TokrEmel2022'; type = 'incollection'; bib = [ ...
'author = {A. M. Tokranova and P. O. Emelinb and A. M. Orlov}, ' ... 
'year = {2022}, ' ...
'title = {Small but Abundant: {D}istribution and Biology of {A}rctic Staghorn Sculpin \emph{Gymnocanthus tricuspis} ({C}ottidae) in the {K}ara {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {62(5)}, ' ...
'pages = {885–899}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocanthus-tricuspis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

