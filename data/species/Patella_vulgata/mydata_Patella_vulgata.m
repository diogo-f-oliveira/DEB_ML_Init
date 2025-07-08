function [data, auxData, metaData, txtData, weights] = mydata_Patella_vulgata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Patellogastropoda'; 
metaData.family     = 'Patellidae';
metaData.species    = 'Patella_vulgata'; 
metaData.species_en = 'Common limpet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wdi'; 'GSI'; 'E_L'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Fred Jean','Starrlight Augustine'};    
metaData.date_subm = [2017 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 30]; 

%% set data
% zero-variate data

data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Blac1969';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Matures after 1 or 2 yr as male, which become female after 4 yr';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Ball1961';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.02;     units.Lj  = 'cm';  label.Lj  = 'shell length at settling'; bibkey.Lj  = 'marlin';
  comment.Lj = 'settlement of larva';
data.Li  = 6;   units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Ball1961';

data.Wwb = 2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'marlin';
  comment.Wwb = 'Based on egg diameter of 160 mum:  4/3*pi*0.008^3';
data.Wdi = 1.9;  units.Wdi = 'g'; label.Wdi = 'ultimate dry weight'; bibkey.Wdi = 'Baxt1983';
  comment.Wdi = 'Based on A*L^3, where ln A = -11.6 and L = 60 mm: exp(-11.6)*60^3';

data.GSI  = 0.3; units.GSI  = '-'; label.GSI = 'gonad dry weight as fraction of flesh dry weight at spawning';  bibkey.GSI  = 'WrigHart1981';   
  temp.GSI = C2K(14); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

data.EW4 = 10; units.EW4   = 'kJ'; label.EW4 = 'energy content at L = 4 cm';  bibkey.EW4  = 'WrigHart1981';   

% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.500	0.297
1.191	1.355
2.216	2.588
3.217	3.387
4.237	3.898
5.213	4.182
6.230	4.322];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d since birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WrigHart1981';

data.tL1 = [ ... % time since birth (yr), shell length (cm)
0.522	0.219
0.555	0.207
0.675	0.288
0.843	0.473
0.999	0.629
1.306	0.693
1.524	1.265
1.548	1.464
1.676	1.417
1.842	1.830
2.011	1.854
3.004	3.143
3.983	4.133
5.013	4.724
6.031	5.238
7.039	5.505
8.021	5.676];
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d since birth
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1    = C2K(14);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Ball1961';
comment.tL1 = 'Data for grp 1, lowest on shore in Fucus serratus community at Batten Bay, Plymouth';
%
data.tL2 = [ ... % time since birth (yr), shell length (cm)
0.527	0.235
0.681	0.421
0.894	0.555
1.001	0.669
1.318	0.685
1.535	1.081
1.686	1.284
1.891	1.405
1.998	1.528
2.998	2.008
4.014	2.369
5.053	2.621
6.056	2.843
7.082	2.991
8.128	3.115
9.082	3.232
10.073	3.331
11.047	3.418
12.003	3.481
12.998	3.513
13.974	3.557];
data.tL2(:,1) = 365 * data.tL2(:,1); % convert yr to d since birth
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'length'};  
temp.tL2    = C2K(14);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Ball1961';
comment.tL2 = 'Data for grp 2, around mid-tide level at Batten Bay, Plymouth';
%
data.tL3 = [ ... % time since birth (yr), shell length (cm)
0.535	0.247
0.697	0.334
1.055	0.637
1.253	0.856
1.548	1.168
1.709	1.601
2.059	1.877
2.974	2.436
3.925	2.835
4.972	3.118
5.985	3.346
6.963	3.526
7.960	3.657
8.923	3.748
9.923	3.831
10.941	3.901];
data.tL3(:,1) = 365 * data.tL3(:,1); % convert yr to d since birth
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since birth', 'length'};  
temp.tL3    = C2K(14);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'Ball1961';
comment.tL3 = 'Data for grp 3, along edge of Ascophyllum community at Batten Bay, Plymouth';
%
data.tL4 = [ ... % time since birth (yr), shell length (cm)
0.535	0.256
0.997	0.728
1.336	0.691
1.549	0.818
2.007	1.461
3.088	1.895
4.142	2.295
5.123	2.513
6.105	2.689
7.142	2.812
8.101	2.893
9.113	2.988
10.046	3.036
11.032	3.076
12.019	3.124
13.005	3.165
14.020	3.165
14.979	3.233
15.913	3.233];
data.tL4(:,1) = 365 * data.tL4(:,1); % convert yr to d since birth
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since birth', 'length'};  
temp.tL4    = C2K(14);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Ball1961';
comment.tL4 = 'Data for grp 4; high on the shore at Batten Bay, Plymouth';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2','tL3','tL4'}; subtitle1 = {'Data for low to high on shore at Batten Bay'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Larval stage lasts 2 till 10 d';
metaData.bibkey.F1 = 'marlin'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '764GF'; % Cat of Life
metaData.links.id_ITIS = '69752'; % ITIS
metaData.links.id_EoL = '401252'; % Ency of Life
metaData.links.id_Wiki = 'Patella_vulgata'; % Wikipedia
metaData.links.id_ADW = 'Patella_vulgata'; % ADW
metaData.links.id_Taxo = '34642'; % Taxonomicon
metaData.links.id_WoRMS = '140685'; % WoRMS
metaData.links.id_molluscabase = '140685'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Patella_vulgata}}';
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
bibkey = 'WrigHart1981'; type = 'Article'; bib = [ ... 
'author = {J. R. Wright and R. G. Hartnoll}, ' ... 
'year = {1981}, ' ...
'title = {An Energy budget for a population of the limpet \emph{Patella vulgata}}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {61}, ' ...
'pages = {627--646}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Blac1969'; type = 'Article'; bib = [ ... 
'author = {D. T. Blackmore}, ' ... 
'year = {1969}, ' ...
'title = {STUDIES OF \emph{Patella vulgata} {L}. I. {G}ROWTH, REPRODUCTlON AND ZONAL DISTRIBUTION }, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {3}, ' ...
'pages = {200--213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Orto1928'; type = 'Article'; bib = [ ... 
'author = {J. H. Orton}, ' ... 
'year = {1928}, ' ...
'title = {Observations on \emph{Patella vulgata}. {P}art I. {S}ex-phenomena, breeding and shell growth}, ' ...
'journal = {J. Mar. Biol. Assoc. U.K.}, ' ...
'volume = {15}, ' ...
'pages = {851--862}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ball1961'; type = 'PhDthesis'; bib = [ ... 
'author = {Ballantine, W. J.}, ' ... 
'year = {1961}, ' ...
'title = {The population dynamics of \emph{Patella vulgata} and other limpets.}, ' ...
'school = {University of London, Queen Mary}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baxt1983'; type = 'Article'; bib = [ ... 
'author = {J. M. Baxter}, ' ... 
'year = {1983}, ' ...
'title = {Annual variations in soft-body dry weight, reproductive cycle and sex ratios in populations of \emph{Patella vulgata} at adjacent sites in the {O}rkney {I}slands}, ' ...
'journal = {Mar. Biol}, ' ...
'volume = {76}, ' ...
'pages = {149--157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4220}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

