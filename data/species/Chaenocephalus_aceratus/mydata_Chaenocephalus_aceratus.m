function [data, auxData, metaData, txtData, weights] = mydata_Chaenocephalus_aceratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Chaenocephalus_aceratus'; 
metaData.species_en = 'Crocodile icefish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0bMcd', 'bjMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};
metaData.date_subm = [2017 04 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Trac2015';   
  temp.ab = C2K(-1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1-2 months';
data.tp = 6.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fishbase';   
  temp.tp = C2K(-1);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '6-8 yr';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(-1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 8; units.Lj  = 'cm';  label.Lj  = 'total length at  metam';     bibkey.Lj  = 'Trac2015'; 
data.Lp  = 61.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Trac2015'; 
data.Lpm = 50.6; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Trac2015'; 
data.Li  = 72; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Trac2015';
  comment.Wwb = 'based on egg diameter of 4.4 mm: 4/3*pi*0.22^3'; 
data.Wwp = 634; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'Trac2015';
  comment.Wwp = 'based on 0.0078 * Lp^2.7449, see F1';
data.Wwpm = 371; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'Trac2015';
  comment.Wwpm = 'based on 0.0078 * Lpm^2.7449, see F1';
data.Wwi = 978; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0078 * Li^2.7449, see F1; fishbase gives 3.7 kg, but that is inconsistent with Li';
 
data.Ri = 22626/365; units.Ri = '#/d';   label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(-1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.374	18.215
1.409	18.217
1.463	22.450
1.497	20.760
1.549	20.762
2.073	24.385
2.073	25.443
2.143	25.869
2.160	25.024
2.161	26.928
2.195	25.872
2.196	26.930
2.196	27.352
2.196	28.198
2.196	28.198
2.265	25.876
2.318	27.359
2.318	28.416
2.477	32.231
2.545	30.332
2.650	31.183
2.738	32.668
2.791	34.363
2.860	34.155
2.894	32.253
2.895	33.945
2.895	33.945
2.964	33.949
2.981	32.470
3.033	32.684
3.069	33.955
3.122	36.918
3.156	34.805
3.227	36.501
3.227	37.981
3.243	34.810
3.453	36.301
3.891	44.572
4.065	43.735
4.154	47.124
4.155	49.450
4.222	45.435
4.502	48.834
4.588	46.724
4.589	47.993
4.851	50.756
4.919	47.376
5.341	57.126
5.360	59.665
5.548	53.542
6.003	59.910
6.037	56.951
6.058	64.989
6.247	60.769
6.438	58.664
6.456	60.780
6.458	65.010
6.577	58.883
6.630	60.366
6.649	63.963
6.667	65.867
6.702	65.234
6.874	62.494
7.155	68.007
7.727	64.231];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(-1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Trac2015';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.105	27.007
2.226	26.165
2.297	27.866
2.628	29.793
2.734	32.980
2.734	34.041
2.856	32.774
2.943	32.355
3.100	33.424
3.432	39.805
3.764	39.822
3.764	41.732
4.183	43.239
4.271	45.789
4.322	42.610
5.562	51.160
5.684	54.136
5.719	51.805
5.753	49.686
5.945	51.393
6.067	50.126
6.085	54.158
6.154	51.616
6.208	55.225
6.555	51.849
6.678	53.129
6.974	53.144];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(-1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Trac2015';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: W = 0.0078 * TL^2.7449';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; demersal; depth range 5 - 770 m. Polar, preferred -1 C; Larvae have a long pelagic phase';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Adults lack hemoglobin in this family';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'T9J4'; % Cat of Life
metaData.links.id_ITIS = '171122'; % ITIS
metaData.links.id_EoL = '46573074'; % Ency of Life
metaData.links.id_Wiki = 'Chaenocephalus_aceratus'; % Wikipedia
metaData.links.id_ADW = 'Chaenocephalus_aceratus'; % ADW
metaData.links.id_Taxo = '170312'; % Taxonomicon
metaData.links.id_WoRMS = '234725'; % WoRMS
metaData.links.id_fishbase = 'Chaenocephalus-aceratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notothenia}}';
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
bibkey = 'Trac2015'; type = 'Article'; bib = [ ... 
'author = {R. J. Traczyk}, ' ... 
'year = {2015}, ' ...
'title = {Age, Growth and Distribution of the {A}ntarctic Fish \emph{Chaenocephalus aceratus} Based on Otoliths }, ' ...
'journal = {Journal of Environmental Science and Engineering}, ' ...
'volume = {A 4}, ' ...
'pages = {401--419}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/SpeciesSummary.php?ID=473&genusname=Chaenocephalus&speciesname=aceratus&AT=Chaenocephalus+aceratus&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
