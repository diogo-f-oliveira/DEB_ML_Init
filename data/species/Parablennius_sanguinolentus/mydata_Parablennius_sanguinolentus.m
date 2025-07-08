function [data, auxData, metaData, txtData, weights] = mydata_Parablennius_sanguinolentus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Blenniidae';
metaData.species    = 'Parablennius_sanguinolentus'; 
metaData.species_en = 'Risty blenny'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 20];

%% set data
% zero-variate data

data.ab = 15.5;   units.ab = 'd';   label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width 0.6 mm of Parablennius ruber: pi/6*0.11*0.06^2';
data.Wwi = 102;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.02, see F1';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Parablennius ruber';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
0	 6.790  7.656
1	 9.512  9.421
2	11.926 11.642
3	13.344 13.788
4	14.835 15.051
5	15.869 15.969
6	16.406 17.386];
data.tL_fm(:,1) = 365 * (.9 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SerrNash1995'; treat.tL_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_1994','tL_1993'}; subtitle1 = {'data for cohorts 1994, 1993'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CMJC'; % Cat of Life
metaData.links.id_ITIS = '636479'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parablennius_sanguinolentus'; % Wikipedia
metaData.links.id_ADW = 'Parablennius_sanguinolentus'; % ADW
metaData.links.id_Taxo = '182614'; % Taxonomicon
metaData.links.id_WoRMS = '126776'; % WoRMS
metaData.links.id_fishbase = 'Parablennius-sanguinolentus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parablennius_sanguinolentus}}';
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
bibkey = 'SerrNash1995'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315400039175}, ' ...
'author = {Ricardo Serr\~{a}o Santos and Richard Nash and Stephen J Hawkins}, ' ... 
'year = {1995}, ' ...
'title = {Age, Growth and Sex Ratio of the {A}zorean Rock-Pool Blenny, \emph{Parablennius sanguinolentus parvicornis}}, ' ...
'journal = {Journal of the Marine Biological Association of the UK}, ' ...
'volume = {75(3)}, ' ...
'pages = {751-754}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Parablennius-sanguinolentus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

