function [data, auxData, metaData, txtData, weights] = mydata_Pleurodema_thaul

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Pleurodema_thaul'; 
metaData.species_en = 'Chilean Four-eyed Frog'; 

metaData.ecoCode.climate = {'BWk', 'Csb', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm','jiTf', 'jiTh'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.am = 5*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'IturOrti2010';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'IturOrti2010';
data.Li  = 6.3;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'IturOrti2010';
data.Lim = 5.9;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'IturOrti2010';

data.Wwb = 6.54e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwi = 39.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected Pelobates fuscus: (6.3/6)^3*34';

data.Ri  = 30*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Eleutherodactylus_coqui: 16 to 40 eggs per clutch, 4 to 6 clutches per yr'; 

% uni-variate data
% time-length
% Locations: 
%  Chaiten (Ch): T  6.5 - 14.5 C  mean 10.5 C
%  Limari (Li):  T 11   - 17   C  mean 14.5 C
%  Laja (La):    T  7   - 19   C  mean 12.5 C
%  Itata (It):   T  9   - 16.5 C  mean 12.75 C
data.tL_fCh = [ ... % yr class (yr), SVL (cm)
1.000	3.264
1.000	3.116
1.984	4.093
1.996	3.627
2.997	4.597
2.997	4.442
3.009	4.346
3.999	4.991
3.999	4.828
3.999	4.754
5.006	5.192];
data.tL_fCh(:,1) = 365 * (0.75 + data.tL_fCh(:,1)); % convert yr to d
units.tL_fCh   = {'d', 'cm'};  label.tL_fCh = {'time since birth', 'SVL', 'Chaiten'};  
temp.tL_fCh    = C2K(10.5);  units.temp.tL_fCh = 'K'; label.temp.tL_fCh = 'temperature';
bibkey.tL_fCh  = 'IturOrti2010';
comment.tL_fCh = 'Data for females at Chaiten';
%
data.tL_fLi = [ ... % yr class (yr), SVL (cm)
1.000	2.192
1.000	2.111
1.990	2.682
1.990	2.645
3.003	3.053
3.014	3.171
3.999	3.461
3.999	3.262
4.004	3.336
5.006	3.485];
data.tL_fLi(:,1) = 365 * (0.75 + data.tL_fLi(:,1)); % convert yr to d
units.tL_fLi   = {'d', 'cm'};  label.tL_fLi = {'time since birth', 'SVL', 'Limari'};  
temp.tL_fLi    = C2K(14.5);  units.temp.tL_fLi = 'K'; label.temp.tL_fLi = 'temperature';
bibkey.tL_fLi  = 'IturOrti2010';
comment.tL_fLi = 'Data for females at Limari';
%
data.tL_fLa = [ ... % yr class (yr), SVL (cm)
1.000	2.909
1.000	2.695
1.000	2.613
2.007	3.458
2.007	3.406
3.009	3.555
3.014	3.740
3.014	3.696
3.999	4.222
3.999	4.060
5.006	4.483
5.006	4.372];
data.tL_fLa(:,1) = 365 * (0.75 + data.tL_fLa(:,1)); % convert yr to d
units.tL_fLa   = {'d', 'cm'};  label.tL_fLa = {'time since birth', 'SVL', 'Laja'};  
temp.tL_fLa    = C2K(12.5);  units.temp.tL_fLa = 'K'; label.temp.tL_fLa = 'temperature';
bibkey.tL_fLa  = 'IturOrti2010';
comment.tL_fLa = 'Data for females at Laja';
%
data.tL_fIt = [ ... % yr class (yr), SVL (cm)
0.994	2.429
2.007	3.361
2.007	3.110
2.007	2.948
2.007	2.807
2.019	2.696
2.991	3.615
2.991	3.748
2.997	3.807
3.003	3.437
4.004	3.919
4.004	3.868
4.004	3.853
4.989	3.988
4.994	4.113];
data.tL_fIt(:,1) = 365 * (0.75 + data.tL_fIt(:,1)); % convert yr to d
units.tL_fIt   = {'d', 'cm'};  label.tL_fIt = {'time since birth', 'SVL', 'Itata'};  
temp.tL_fIt    = C2K(12.75);  units.temp.tL_fIt = 'K'; label.temp.tL_fIt = 'temperature';
bibkey.tL_fIt  = 'IturOrti2010';
comment.tL_fIt = 'Data for females at Itata';
%
data.tL_mCh = [ ... % yr class (yr), SVL (cm)
0.994	3.005
1.006	3.227
1.997	3.692
1.998	3.581
2.994	4.143
2.995	4.054
2.996	4.002
3.986	4.557
3.991	4.483
4.994	4.631];
data.tL_mCh(:,1) = 365 * (0.75 + data.tL_mCh(:,1)); % convert yr to d
units.tL_mCh   = {'d', 'cm'};  label.tL_mCh = {'time since birth', 'SVL', 'Chaiten'};  
temp.tL_mCh    = C2K(10.5);  units.temp.tL_mCh = 'K'; label.temp.tL_mCh = 'temperature';
bibkey.tL_mCh  = 'IturOrti2010';
comment.tL_mCh = 'Data for males at Chaiten';
%
data.tL_mLi = [ ... % yr class (yr), SVL (cm)
1.011	2.081
1.986	2.421
1.997	2.495
2.009	2.303
2.994	2.621
3.000	2.672
4.003	2.709
4.994	2.798];
data.tL_mLi(:,1) = 365 * (0.75 + data.tL_mLi(:,1)); % convert yr to d
units.tL_mLi   = {'d', 'cm'};  label.tL_mLi = {'time since birth', 'SVL', 'Limari'};  
temp.tL_mLi    = C2K(14.5);  units.temp.tL_mLi = 'K'; label.temp.tL_mLi = 'temperature';
bibkey.tL_mLi  = 'IturOrti2010';
comment.tL_mLi = 'Data for males at Limari';
%
data.tL_mLa = [ ... % yr class (yr), SVL (cm)
0.994	2.547
1.000	2.584
1.986	2.931
1.991	2.887
1.997	3.012
1.998	2.850
2.003	2.813
2.994	3.714
2.995	3.515
2.996	3.426
3.006	3.315
3.007	3.264
3.997	3.766
4.003	3.840
4.994	3.914
5.000	3.966];
data.tL_mLa(:,1) = 365 * (0.75 + data.tL_mLa(:,1)); % convert yr to d
units.tL_mLa   = {'d', 'cm'};  label.tL_mLa = {'time since birth', 'SVL', 'Laja'};  
temp.tL_mLa    = C2K(12.5);  units.temp.tL_mLa = 'K'; label.temp.tL_mLa = 'temperature';
bibkey.tL_mLa  = 'IturOrti2010';
comment.tL_mLa = 'Data for males at Laja';
%
data.tL_mIt = [ ... % yr class (yr), SVL (cm)
1.000	2.259
1.001	2.207
1.991	2.569
1.992	2.443
3.006	2.968
3.991	2.931
5.006	3.020];
data.tL_mIt(:,1) = 365 * (0.75 + data.tL_mIt(:,1)); % convert yr to d
units.tL_mIt   = {'d', 'cm'};  label.tL_mIt = {'time since birth', 'SVL', 'Itata'};  
temp.tL_mIt    = C2K(12.75);  units.temp.tL_mIt = 'K'; label.temp.tL_mIt = 'temperature';
bibkey.tL_mIt  = 'IturOrti2010';
comment.tL_mIt = 'Data for males at Itata';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fCh = 50 * weights.tL_fCh;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fCh','tL_fLi','tL_fLa','tL_fIt'}; subtitle1 = {'Data for females at Chaiten, Limari, Laja, Itata '};
set2 = {'tL_mCh','tL_mLi','tL_mLa','tL_mIt'}; subtitle2 = {'Data for males at Chaiten, Limari, Laja, Itata '};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Direct development, eggs on land on palm leaves and in bird nests'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KBF3'; % Cat of Life
metaData.links.id_ITIS = '207987'; % ITIS
metaData.links.id_EoL = '319983'; % Ency of Life
metaData.links.id_Wiki = 'Pleurodema_thaul'; % Wikipedia
metaData.links.id_ADW = 'Pleurodema_thaul'; % ADW
metaData.links.id_Taxo = '141057'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pleurodema+thaul'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurodema_thaul}}';
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
bibkey = 'IturOrti2010'; type = 'Article'; bib = [ ... 
'author = {Myriam Iturra-Cid and Juan C. Ortiz and Nora R. Ibarg\"{u}engoyt\''{i}a}, ' ... 
'year = {2010}, ' ...
'title = {Age, Size, and Growth of the Chilean Frog \emph{Pleurodema thaul} ({A}nura: {L}eiuperidae): Latitudinal and Altitudinal Effects}, ' ...
'journal = {Copeia}, ' ...
'volume = {2010(4)}, ' ...
'pages = {609-617}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pleurodema+thaul}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

