function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_ravus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_ravus'; 
metaData.species_en = 'Drab  emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(26.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 16; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 33;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'EbisOzaw2009';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 52.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01349*Lp^2.98, see F1';
data.Wwi = 452;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.98, see F1';

data.GSI = 0.06; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = {'Ebis2006','guess'};
  temp.GSI = C2K(26.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lethrinus_ornatus';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.430	19.231
1.737	21.210
1.860	22.633
1.962	22.880
2.125	24.302
2.166	25.786
2.166	25.663
2.207	23.560
2.289	24.735
2.452	25.848
2.473	25.044
2.513	25.972
2.575	25.786
2.616	26.776
2.820	28.445
2.820	27.703
2.861	28.074
2.943	27.023
3.004	24.859
3.004	27.147
3.004	28.322
3.024	28.693
3.045	26.528
3.065	28.012
3.106	27.208
3.126	26.652
3.126	27.641
3.208	29.249
3.249	27.394
3.290	28.569
3.331	28.074
3.392	28.631
3.433	26.714
3.433	26.281
3.433	27.765
3.474	27.023
3.515	28.260
3.515	27.765
3.515	27.394
3.515	24.797
3.617	27.085
3.780	27.270
3.821	28.878
3.883	29.929
3.903	29.187
3.923	26.776
3.923	26.343
3.944	27.208
3.985	27.641
3.985	28.383
3.985	29.620
4.005	30.857
4.107	27.023
4.107	28.816
4.169	27.023
4.169	29.249
4.250	29.311
4.332	28.816
4.393	30.177
4.414	28.198
4.434	29.744
4.434	28.816
4.434	27.889
4.455	27.208
4.536	29.125
4.618	28.198
4.618	28.445
4.659	28.816
4.761	31.599
4.843	28.754
4.863	28.940
4.884	30.733
4.904	28.012
4.945	30.053
4.966	30.424
4.986	28.322
5.027	30.795
5.027	30.177
5.027	28.507
5.047	29.558
5.231	30.981
5.292	30.424
5.354	30.053
5.538	29.991
5.660	29.125
5.660	29.806];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(26.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.922	28.631
3.453	28.816
3.780	29.435
4.189	30.362
4.393	30.733
4.700	28.012
4.720	29.991
4.761	29.311
4.761	28.198
4.843	29.558
4.925	31.537
5.027	28.322
5.047	31.846
5.149	30.239
5.272	30.486
5.374	27.270
5.415	30.486
5.436	28.074
5.681	31.537
5.681	31.166
5.803	31.228
5.905	30.548
5.905	29.991
5.926	28.940
5.967	30.424
5.967	32.217
6.008	31.290
6.028	28.322
6.130	29.744
6.232	31.537
6.253	29.744
6.273	32.094
6.416	30.115
6.437	28.940
6.478	30.795
6.478	29.435
6.600	31.723
6.723	30.671
6.866	31.104
7.009	29.806
7.193	32.527
7.254	31.166
7.520	31.537
7.520	29.064
7.663	31.166
7.867	31.166
8.010	29.744
8.787	31.042
8.950	31.537
11.055	29.620
11.995	31.970
14.549	31.537];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(26.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01349*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '722PV'; % Cat of Life
metaData.links.id_ITIS = '647949'; % ITIS
metaData.links.id_EoL = '46580963'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_ravus'; % ADW
metaData.links.id_Taxo = '194163'; % Taxonomicon
metaData.links.id_WoRMS = '278638'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-ravus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus}}';
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
bibkey = 'EbisOzaw2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0061-9}, ' ...
'author = {Akihiko Ebisawa and Takakazu Ozawa}, ' ... 
'year = {2009}, ' ...
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {75}, ' ...
'pages = {553–566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ebis2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0345-3}, ' ...
'author = {Akihiko Ebisawa}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive and sexual characteristics in five Lethrinus species in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {53}, ' ...
'pages = {269–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-ravus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
