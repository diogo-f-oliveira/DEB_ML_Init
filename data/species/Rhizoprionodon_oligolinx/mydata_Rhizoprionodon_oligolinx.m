function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_oligolinx

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_oligolinx'; 
metaData.species_en = 'Grey sharpnose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 29];

%% set data
% zero-variate data
data.ab = 145;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 25;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '20-30 cm';
data.Lp  = 43.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 84.5;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 2.85e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00331*Li^3.08, see F1';

data.Ri  = 4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 pups per litter, 1 litter per yr assumed';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.244	35.545
0.477	40.168
0.494	43.148
0.721	52.809
0.827	55.119
0.918	58.800
0.989	59.043
1.077	62.265
1.126	62.503
1.168	63.427
1.220	64.352
1.385	65.299
1.485	67.837
1.650	65.118
1.660	66.953
1.722	69.025
1.735	65.821
1.916	69.977];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'PuruDash2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00331*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SDDL'; % Cat of Life
metaData.links.id_ITIS = '160222'; % ITIS
metaData.links.id_EoL = '46559820'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_oligolinx'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_oligolinx'; % ADW
metaData.links.id_Taxo = '106460'; % Taxonomicon
metaData.links.id_WoRMS = '217359'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-oligolinx'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_oligolinx}}';
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
bibkey = 'PuruDash2017'; type = 'article'; bib = [ ... 
'doi = {10.21077/ijf.2017.64.3.67657-02}, ' ...
'author = {G. B. Purushottama and Gyanaranjan Dash and Thakurdas and K. V. Akhilesh and Shoba Joe Kizhakudan and P. U. Zacharia}, ' ... 
'year = {2017}, ' ...
'title = {Population dynamics and stock assessment of grey sharpnose shark \emph{Rhizoprionodon oligolinx} {S}pringer, 1964 ({C}hondrichthyes: {C}archarhinidae) from the north-west coast of {I}ndia}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {64(3)}, ' ...
'pages = {8-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhizoprionodon_oligolinx.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

