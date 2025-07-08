function [data, auxData, metaData, txtData, weights] = mydata_Fusconaia_cuneolus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Fusconaia_cuneolus'; 
metaData.species_en = 'Fine-rayed pigtoe'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 03];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 35*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Brue1989';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Baue1987 gives 93 yrs is typical in natural populations';

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 9;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Brue1989';

data.Wwi  = 26; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus: 14*(9/7.3)^3';

data.Ri = 113e3/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate for SL 6.3 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL1 = [ ... % time since birth (yr), shell length (cm)
0.912	0.961
2.111	1.642
3.138	2.536
4.109	3.444
5.258	3.938
6.185	4.446
7.119	4.700
8.222	4.821
8.870	5.408
10.087	5.436
10.855	5.703
11.947	6.251
13.000	6.172
14.109	6.106
14.969	7.053
17.059	7.522
17.952	7.243
20.111	7.245
23.145	7.621];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'Slant, Virginia'};  
temp.tL1 = C2K(22);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Brue1989';
comment.tL1 = 'Data from Slant, Virginia; mean temperature is guessed';
%
data.tL2 = [ ... % time since birth (yr), shell length (cm)
1.082	0.828
2.176	1.282
3.157	1.843
4.193	2.417
5.178	2.805
6.107	3.246
7.146	3.726
8.141	3.767
9.120	4.382
9.945	4.582
11.027	5.490
11.965	5.571
12.847	5.718
14.928	6.507
16.027	6.828
16.959	7.135
17.891	7.456
20.109	7.325
24.970	7.676
27.054	8.357
30.108	8.000];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Pendleton Island, Virginia'};  
temp.tL2 = C2K(17);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Brue1989';
comment.tL2 = 'Data from Pendleton Island, Virginia; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 10 * weights.tL1;
weights.tL2 = 10 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from Slant, Pendleton Island'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Facultative hermaphroditic';
metaData.bibkey.F1 = 'Brue1989'; 
F2 = 'Amblemine glochidia were absent on non-cyprinid fish species';
metaData.bibkey.F2 = 'Brue1989'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6JSJ2'; % Cat of Life
metaData.links.id_ITIS = '80045'; % ITIS
metaData.links.id_EoL = '449622'; % Ency of Life
metaData.links.id_Wiki = 'Fusconaia_cuneolus'; % Wikipedia
metaData.links.id_ADW = 'Fusconaia_cuneolus'; % ADW
metaData.links.id_Taxo = '387839'; % Taxonomicon
metaData.links.id_WoRMS = '857889'; % WoRMS
metaData.links.id_molluscabase = '857889'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fusconaia_cuneolus}}';
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
bibkey = 'Brue1989'; type = 'Phdthesis'; bib = [ ...
'author = {Sue A. Bruenderman}, ' ... 
'year = {1989}, ' ...
'title = {Life history of the endangered fine-rayed pigtoe pearly mussel \emph{Fusconaia cuneolus} ({L}ea, 1840), in the Clinch River, Virginia}, ' ...
'school = {Virginia Polytechnic Instigtute and State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

