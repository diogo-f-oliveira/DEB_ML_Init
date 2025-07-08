function [data, auxData, metaData, txtData, weights] = mydata_Pelobates_cultripes
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelobatidae';
metaData.species    = 'Pelobates_cultripes'; 
metaData.species_en = 'Iberian spadefoot'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 16];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'LeclLecl2005';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';  label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'LeclLecl2005';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 2.7;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'LeclLecl2005'; 
data.Lp  = 3.9;  units.Lp  = 'cm';  label.Lp  = 'ultimate SVL for females';   bibkey.Lp  = 'LeclLecl2005';
data.Li  = 7.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'LeclLecl2005';
data.Lim = 6.5;  units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'LeclLecl2005';

data.Wwb = 3.1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter 1.15-2.0 mm for Pelobates syriacus: pi/6*0.18^3';
data.Wwi = 40; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'LeclLecl2005';
data.Wwim = 32;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'LeclLecl2005';

data.Ri  = 2318/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'LizaMarq1994';   
  temp.Ri  = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
0	2.884 2.884
1	3.627 3.627
2	3.965 3.812
3	4.882 4.413
4	5.450 5.155
5	5.854 5.472
6	6.214 5.734
7	6.640 6.105];
data.tL_fm(:,1) = (data.tL_fm(:,1)+1.8)  * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm    = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'LeclLecl2005'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
2.882	2.388
2.912	2.559
2.913	2.814
2.955	2.388
3.003	2.388
3.009	2.814
3.070	2.985
3.112	2.729
3.112	3.241
3.161	2.985
3.161	3.582
3.191	3.326
3.306	4.435
3.409	3.326
3.409	3.753
3.409	4.264
3.470	4.264
3.518	4.520
3.616	6.226
3.621	5.117
3.719	5.800
3.724	4.947
3.809	5.203
3.809	6.055
3.870	5.885
3.900	6.567
3.906	5.714
4.003	6.652
4.112	7.164
4.209	7.164
4.210	9.638
4.312	8.102
4.403	8.529
4.501	10.576
4.610	12.196
4.713	11.343
4.816	10.832
4.908	15.011
4.913	13.049
5.011	16.972
5.096	16.205
5.297	21.151
5.399	17.655
5.399	19.701
5.501	15.096
5.503	22.004
5.515	21.151
5.806	23.198
5.811	19.446
6.114	39.574
6.296	23.113
6.394	26.610
6.498	27.974
6.498	30.362
6.499	32.154
6.502	41.620
6.515	26.951
6.604	40.256
6.814	31.983
7.009	36.077];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'females'};  
bibkey.LW_f  = 'LeclLecl2005'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
4.004	7.505
4.622	10.235
4.713	11.855
4.990	8.102
5.108	15.352
5.205	17.228
5.278	18.934
5.296	18.422
5.399	16.546
5.502	17.313
5.891	24.136
5.896	21.237
5.897	22.260
5.908	20.128
5.989	26.695
6.001	25.928
6.002	32.068
6.202	30.021
6.499	33.774
6.508	22.772];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'males'};  
bibkey.LW_m  = 'LeclLecl2005'; 
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '76CZC'; % Cat of Life
metaData.links.id_ITIS = '664729'; % ITIS
metaData.links.id_EoL = '330862'; % Ency of Life
metaData.links.id_Wiki = 'Pelobates_cultripes'; % Wikipedia
metaData.links.id_ADW = 'Pelobates_cultripes'; % ADW
metaData.links.id_Taxo = '47554'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelobates+cultripes'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelobates_cultripes}}';
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
bibkey = 'LeclLecl2005'; type = 'Article'; bib = [ ... 
'doi = {10.1163/017353711x605678}, ' ...
'author = {Maria Helena Leclair and Raymond Leclair and Julie Gallant}, ' ... 
'year = {2005}, ' ...
'title = {Application of Skeletochronology to a Population of \emph{Pelobates cultripes} ({A}nura: {P}elobatidae) from {P}ortugal}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {39(2)}, ' ...
'pages = {199-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LizaMarq1994'; type = 'Article'; bib = [ ... 
'author = {Miguel Lizana and Rafael Marquez and Roberto Martin-Sanchez}, ' ... 
'year = {1994}, ' ...
'title = {Reproductive biology of \emph{Pelobates cultripes} ({A}nura: {P}elobatidae) in Central Spain}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {28(1)}, ' ...
'pages = {19-27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pelobates+cultripes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
