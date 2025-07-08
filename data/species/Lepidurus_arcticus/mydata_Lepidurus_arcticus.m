function [data, auxData, metaData, txtData, weights] = mydata_Lepidurus_arcticus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Notostraca'; 
metaData.family     = 'Triopsidae';
metaData.species    = 'Lepidurus_arcticus'; 
metaData.species_en = 'Arctic tadpole shrimp'; 

metaData.ecoCode.climate = {'Dfb','E'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD','biHa','biCi'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L_T';'L-N'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Dina Lika'};
metaData.email_cur = {'lika@uoc.gr'}; 
metaData.date_acc  = [2024 01 30]; 

%% set data
% zero-variate data

data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Arno1966';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 20;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki gives 90 d';
  
data.Lb  = 0.18;  units.Lb  = 'cm';  label.Lb  = 'carapace length at birth'; bibkey.Lb  = 'guess';
data.Lp  = 0.48;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Arno1966';
data.Li  = 2.3; units.Li  = 'cm';  label.Li  = 'ultimate carapace length';     bibkey.Li  = 'Lakk2015';
  comment.Li = 'Lakk2015: 7.85 mm carapace lenght at Spitsbergen; rapid growth at end observations';
data.Lim  = 2.28; units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'Arno1966';
  comment.Lim = 'Lakk2015: 7.81 mm carapace lenght at Spitsbergen for males; 7.81/7.85*2.3';

data.Wwi = 0.295;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Triops_longicaudatus: (2.51/3.1)^3*0.555';

% uni-variate data
% time-length
data.tL = [ ... % time since Aug 10 (d), carapace length (cm)
1.973	0.357
3.005	0.482
3.904	0.830
3.982	0.634
4.011	0.610
4.970	0.701
4.973	0.680
5.055	0.656
5.060	1.017]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = [0 4; 5 19];  units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'Arno1966';

% length-fecundity
data.LN = [ ... % carapace length (cm), fecundity (#)
0.300	0.000
0.400	0.000
0.499	2.051
0.599	1.336
0.698	1.923
0.799	1.718
0.902	1.895
0.998	2.284
1.102	3.054
1.202	3.797
1.301	4.242
1.401	2.468
1.505	6.505];
units.LN   = {'cm', '#'};  label.LN = {'carapace length', 'fecundity','Greenland'};  
temp.LN    = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Arno1966'; comment.LN = 'East Greenland';

data.LN_S = [ ... % carapace length (cm), fecundity (#)
0.306	0.000
0.400	0.000
0.504	0.121
0.604	0.329
0.701	0.559
0.802	0.957
0.903	1.461
1.003	2.237
1.105	2.215
1.203	3.538
1.304	4.546
1.400	5.765
1.506	8.055];
units.LN_S   = {'cm', '#'};  label.LN_S = {'carapace length', 'fecundity','Spitsbergen'};  
temp.LN_S    = C2K(10);  units.temp.LN_S = 'K'; label.temp.LN_S = 'temperature';
bibkey.LN_S = 'Lakk2013'; comment.LN_S = 'Spitsbergen';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LN','LN_S'}; subtitle1 = {'Data for Greenland, Spitsbergen'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'and accumulation time of 1 d is assumed for LN data';
metaData.discussion = struct('D1',D1, 'D2',D2);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PC2F'; % Cat of Life
metaData.links.id_ITIS = '83759'; % ITIS
metaData.links.id_EoL = '338975'; % Ency of Life
metaData.links.id_Wiki = 'Lepidurus_arcticus'; % Wikipedia
metaData.links.id_ADW = 'Lepidurus_arcticus'; % ADW
metaData.links.id_Taxo = '76182'; % Taxonomicon
metaData.links.id_WoRMS = '1561270'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triops_longicaudatus}}';
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
bibkey = 'Arno1966'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00222936608651674}, ' ...
'author = {Arnold, G.P.}, ' ... 
'year = {1966}, ' ...
'title = {Observations on \emph{Lepidurus arcticus} ({P}allas) ({C}rustacea, {N}otostraca) in {E}ast {G}reenland}, ' ...
'journal = {Journal of Natural History Series 13}, ' ...
'volume = {9(106-108)}, ' ...
'pages = {599–617}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lakk2015'; type = 'Article'; bib = [ ... 
'doi = {10.1163/1937240X-00002324}, ' ...
'author = {Hanna-Kaisa Lakka}, ' ... 
'year = {2015}, ' ...
'title = {Description of the male \emph{Lepidurus arcticus} ({B}ranchiopoda: {N}otostraca) and the potential role of cannibalism in defining male form and population sex ratio}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {35(3)}, ' ...
'pages = {319-329}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lakk2013'; type = 'phdthesis'; bib = [ ... 
'doi = {10.1163/1937240X-00002324}, ' ...
'author = {Hanna-Kaisa Lakka}, ' ... 
'year = {2013}, ' ...
'title = {The ecology of a freshwater crustacean: \emph{Lepidurus arcticus} ({B}rachiopoda; {N}otostraca) in a High Arctic region}, ' ...
'school = {University of Helsinki, Lahti}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

