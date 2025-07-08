function [data, auxData, metaData, txtData, weights] = mydata_Noturus_miurus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_miurus'; 
metaData.species_en = 'Brindled madtom'; 

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

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data;

data.am = 3*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 3.7/0.86;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'BrooMayd1982';
  comment.Lp = 'Based on SL 3.7 cm, see F2';
data.Li  = 13;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 2.446e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BrooMayd1982'; 
  comment.Wwb = 'based on egg diameter of 3.6 mm: pi/6*0.36^3';
   
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), standard length (cm)
26.853	1.154
62.013	3.645
93.253	4.154
123.208	3.878
151.744	3.580
184.540	3.351
212.837	4.389
276.935	4.323
304.005	4.255
338.085	4.810
364.975	5.756
392.091	5.434
424.805	5.666
454.682	5.829
485.906	6.430
513.169	5.278
544.221	6.847
575.736	5.811
636.883	6.321
668.324	5.700
726.626	6.186
759.307	6.603];
data.tL_f(:,2) = data.tL_f(:,2)/ 0.86; % convert SL to TL
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BrooMayd1982';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (d), standard length (cm)
64.857	3.668
96.072	4.315
123.167	4.109
158.770	4.110
187.248	4.135
212.870	4.205
276.955	4.208
305.376	4.555
335.229	4.856
369.363	5.111
393.474	5.665
419.182	5.251
458.840	6.475
491.635	6.245
518.710	6.154
545.571	7.262
577.119	6.042
635.348	6.943
669.629	6.368
700.972	6.300
728.018	6.371
759.348	6.372
821.808	7.504
851.682	7.690
1063.969	7.169
1064.043	6.754
1092.525	6.755
1095.341	6.939];
data.tL_m(:,2) = data.tL_m(:,2)/ 0.86; % convert SL to TL
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BrooMayd1982';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
61.731	0.657
92.510	1.196
128.173	1.060
152.441	0.715
185.542	1.193
215.430	1.133
273.955	1.251
308.192	1.759
336.712	2.208
364.877	3.481
399.353	3.435
428.409	2.640
459.194	3.163
485.410	3.627
517.499	3.791
553.672	5.138
578.391	3.744
637.490	5.196
672.385	4.176
701.725	5.389
729.167	5.673
762.675	5.208
823.181	6.060
1064.931	7.432
1096.026	7.236];
temp.tWw_f    = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth','wet weight'};  
bibkey.tWw_f = 'BrooMayd1982';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
    5.6 75
    5.4 74
    5.4 48
    5.5 56
    5.6 73
    5.3 53
    5.9 88
    6.8 90
    7.0 86
    5.1 42
    5.5 52
    6.6 57];
data.LN(:,2) = data.LN(:,2)/ 0.84; % convert SL to TL
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BrooMayd1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZN3'; % Cat of Life
metaData.links.id_ITIS = '164020'; % ITIS
metaData.links.id_EoL = '208074'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_miurus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_miurus'; % ADW
metaData.links.id_Taxo = '181578'; % Taxonomicon
metaData.links.id_WoRMS = '1020187'; % WoRMS
metaData.links.id_fishbase = 'Noturus-miurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_miurus}}';
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
bibkey = 'BrooMayd1982'; type = 'article'; bib = [ ...  
'author = {Brooks M. Burr and Richard L. Mayden}, ' ...
'year = {1982}, ' ...
'title = {Life History of the Brindled Madtom \emph{Noturus miurus} in {M}ill {C}reek, {I}llinois ({P}isces: {I}ctaluridae)}, ' ... 
'journal = {The American Midland Naturalist}, '...
'volume = {107(1)}, ' ...
'pages = {25-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-miurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

