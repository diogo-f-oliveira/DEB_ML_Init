function [data, auxData, metaData, txtData, weights] = mydata_Arca_noae

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Arcida'; 
metaData.family     = 'Arcidae';
metaData.species    = 'Arca_noae'; 
metaData.species_en = 'Noah''s ark shell'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 05]; 

%% set data
% zero-variate data

data.am = 16*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'PehaRich2002';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'guess';
data.Lp  = 1; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'GhriBell2017';
  comment.Lp = 'based on shell length 2 cm: 2/7*3.5';
data.Li  = 3.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'PehaRich2002';
  comment.Li = 'shell length 7 cm';

data.Wwb = 5.8e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PehaMlad2006';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/9*0.0055^3'; 
data.Wdi = 2.3; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'GhriBell2017';
  comment.Wdi = 'Shell length is not clear';

data.Ri  = 5e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate for assumed SL 3 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% time-length 
data.tLM = [ ... % time since settlement (a), shell height  (cm)
0.904	0.596
1.922	1.041
2.967	1.404
3.985	1.731
5.030	1.988
6.020	2.246
7.037	2.421
7.941	2.596
9.043	2.702
10.004	2.865
10.880	2.959
11.983	3.006
13.057	3.228];
data.tLM(:,1) = data.tLM(:,1) * 365; % convert yr to d
units.tLM   = {'d', 'cm'};  label.tLM = {'time since settlement', 'shell height', 'Marina'};  
temp.tLM    = C2K(19);  units.temp.tLM = 'K'; label.temp.tLM = 'temperature';
bibkey.tLM = 'PehaRich2002';
comment.tLM = 'Data from Marina';
%
data.tLS = [ ... % time since settlement (a), shell height  (cm)
0.929	0.570
2.000	1.093
2.958	1.430
3.918	1.686
4.962	1.895
5.922	2.070
7.023	2.221
7.983	2.384
8.915	2.500
9.932	2.605
10.921	2.663
11.994	2.814
12.984	2.733
13.944	2.965
14.029	2.988
14.961	3.035
15.980	2.826];
data.tLS(:,1) = data.tLS(:,1) * 365; % convert yr to d
units.tLS   = {'d', 'cm'};  label.tLS = {'time since settlement', 'shell height', 'Mali Ston Bay'};  
temp.tLS    = C2K(19);  units.temp.tLS = 'K'; label.temp.tLS = 'temperature';
bibkey.tLS = 'PehaRich2002';
comment.tLS = 'Data from Mali Ston Bay';
%
data.tLJ = [ ... % time since settlement (a), shell height  (cm)
0.927	0.490
2.024	0.875
3.037	1.166
3.994	1.411
5.037	1.598
5.993	1.878
7.036	2.041
7.965	2.157
9.037	2.204
9.966	2.321
10.953	2.437
12.023	2.601
13.009	2.671];
data.tLJ(:,1) = data.tLJ(:,1) * 365; % convert yr to d
units.tLJ   = {'d', 'cm'};  label.tLJ = {'time since settlement', 'shell height', 'Malo Jezero'};  
temp.tLJ    = C2K(19);  units.temp.tLJ = 'K'; label.temp.tLJ = 'temperature';
bibkey.tLJ = 'PehaRich2002';
comment.tLJ = 'Data from Malo Jezero';

%% set weights for all real data
weights = setweights(data, []);
weights.tLM = 5 * weights.tLM;
weights.tLS = 5 * weights.tLS;
weights.tLJ = 5 * weights.tLJ;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLM','tLS','tLJ'}; subtitle1 = {'Data from Marina, Mali Ston Bay, Malo Jezero'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-length: shell length in mm =  14.3 + 1.61 * shell height in mm';
metaData.bibkey.F1 = 'PehaRich2002'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6823L'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46465867'; % Ency of Life
metaData.links.id_Wiki = 'Arca_noae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39121'; % Taxonomicon
metaData.links.id_WoRMS = '138788'; % WoRMS
metaData.links.id_molluscabase = '138788'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PehaRich2002'; type = 'Article'; bib = [ ... 
'author = {Melita Peharda and Christopher A. Richardson and Vladimir Onofri and Ana Brato\v{s} and Marija Crn\v{c}evi\''{c}}, ' ... 
'year = {2002}, ' ...
'title = {AGE AND GROWTH OF THE BIVALVE \emph{Arca_noae} {L}. IN THE {C}ROATIAN {A}DRIATIC {S}EA}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {82}, ' ...
'pages = {307-310}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PehaMlad2006'; type = 'Article'; bib = [ ... 
'author = {Melita Peharda and Ivona Mladineo and Jak\v{s}a Bolotin and Lovorka Kekez and Bo\v{s}ko Skaramuca}, ' ... 
'year = {2002}, ' ...
'title = {The reproductive cycle and potential protandric development of the {N}oah''s Ark shell, \emph{Arca noae} {L}.: {I}mplications for aquaculture}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {252}, ' ...
'pages = {317-327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GhriBell2017'; type = 'Article'; bib = [ ... 
'doi = {10.1080/24750263.2017.1368725}, ' ...
'author = {F. Ghribi and G. Bello and R. Zupa and L. Passantino and N. Santamaria and M. El Cafsi and A. Corriero}, ' ... 
'year = {2017}, ' ...
'title = {Reproductive and tissue plasticity in Arca noae (Bivalvia: Arcidae)}, ' ...
'journal = {The European Zoological Journal}, ' ...
'volume = {84(1)}, ' ...
'pages = {473-487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Arca-noae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

