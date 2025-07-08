function [data, auxData, metaData, txtData, weights] = mydata_Sparisoma_viride
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Sparisoma_viride'; 
metaData.species_en = 'Stoplight parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 01];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LessSilv2015';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 64;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm of Calotomus_japonicus: pi/6*0.066^3'; 
data.Wwp = 68.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01380*Lp^3.05, see F1';
data.Wwi = 4.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.05, see F1; max. published weight: 1.6 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
% time-length
data.tL = [ ... %  time since birth (yr), length (cm)
0.369	6.138
0.395	4.994
0.418	7.708
0.616	9.563
1.008	19.557
1.925	23.687
1.951	22.686
1.972	28.400
1.978	18.972
1.998	25.400
1.999	24.686
2.003	19.400
2.048	26.971
2.967	29.672
2.968	29.100
2.991	30.672
3.911	30.373
3.960	32.801
3.984	33.943
4.008	35.371
4.928	35.358
4.954	34.358
5.004	33.643
5.005	32.214
5.948	35.201
7.018	35.471
8.011	37.886
9.033	34.871];
data.tL(:,1) = 365 * (data.tL(:,1) + 0);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length','Lee Stocking'};  
temp.tL    = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChoaRobe2003'; 
%
data.tL1 = [ ... %  time since birth (yr), length (cm)
0.428	8.789
0.933	19.562
1.004	14.312
1.005	15.163
1.033	21.120
1.978	20.256
2.003	20.965
2.032	27.347
2.128	22.382
2.154	24.083
3.026	26.482
3.079	30.453
3.999	30.582
4.073	29.304
7.083	29.829
7.107	28.694];
data.tL1(:,1) = 365 * (data.tL1(:,1) + 0);
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length','San Blas'};  
temp.tL1    = C2K(27.2);  units.temp.tL1 = 'K'; label.temp.tL = 'temperature';
bibkey.tL1 = 'ChoaRobe2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for Lee Stocking, San Blas'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01380*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YVG5'; % Cat of Life
metaData.links.id_ITIS = '170867'; % ITIS
metaData.links.id_EoL = '46572719'; % Ency of Life
metaData.links.id_Wiki = 'Sparisoma_viride'; % Wikipedia
metaData.links.id_ADW = 'Sparisoma_viride'; % ADW
metaData.links.id_Taxo = '187880'; % Taxonomicon
metaData.links.id_WoRMS = '273780'; % WoRMS
metaData.links.id_fishbase = 'Sparisoma-viride'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished170927 = {\url{http://en.wikipedia.org/wiki/Sparisoma_viride}}';
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
bibkey = 'ChoaRobe2003'; type = 'article'; bib = [ ... 
'doi = {10.1017/s0025315415001034}, ' ...
'author = {J. H. Choat and D. R. Robertson and J. L. Ackerman and J. M. Posada}, ' ... 
'year = {2003}, ' ...
'title = {An age-based demographic analysis of the {C}aribbean stoplight parrotfish \emph{Sparisoma viride}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {246}, ' ...
'pages = {265–277}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sparisoma-viride.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

