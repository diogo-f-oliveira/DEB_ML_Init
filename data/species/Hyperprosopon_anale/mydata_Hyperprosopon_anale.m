function [data, auxData, metaData, txtData, weights] = mydata_Hyperprosopon_anale
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Embiotocidae';
metaData.species    = 'Hyperprosopon_anale'; 
metaData.species_en = 'Spotfin surfperch'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.7); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 19];

%% set data
% zero-variate data

data.am = 4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BaltKnig1983';   
  temp.am = C2K(12.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 2; units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'guess'; 
data.Lp  = 8; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'fishbase';

data.Wwi = 122; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'DeMaMoor1983';
  comment.Wwi = 'based on 0.01318*Li^3.05, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % time (d), standard length (cm)
1 10.3 8.1
2 11.6 8.2
3 12.1 NaN];
data.tL_fm(:,1) = 365 * (0.2 + data.tL_fm(:,1)); % set origin to time since birth
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'standard length'};  
temp.tL_fm    = C2K(12.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BaltKnig1983'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
8.154	4.036
8.329	5.074
8.521	5.104
9.187	5.104
9.334	5.074
9.377	6.024
9.495	6.053
9.527	5.045
9.806	6.024
9.877	7.122
9.905	8.012
10.192	4.985
10.206	5.282
10.232	7.003
10.392	8.101
10.456	6.024
10.540	8.398
10.541	8.012
10.600	7.745
10.612	8.991
10.646	6.914
10.750	6.944
10.795	6.736
10.804	9.050
10.880	8.101
10.952	9.080
10.958	6.588
10.980	9.970
10.986	7.003
11.060	7.003
11.073	8.042
11.117	8.012
11.221	7.745
11.548	7.181
11.729	12.047
11.995	12.136
12.027	11.068
12.065	14.065
12.173	12.047
12.215	13.116
12.336	11.958
12.558	12.018
15.941	20.059];
units.LN   = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN    = C2K(12.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BaltKnig1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MPPH'; % Cat of Life
metaData.links.id_ITIS = '169747'; % ITIS
metaData.links.id_EoL = '46572851'; % Ency of Life
metaData.links.id_Wiki = 'Hyperprosopon_anale'; % Wikipedia
metaData.links.id_ADW = 'Hyperprosopon_anale'; % ADW
metaData.links.id_Taxo = '177026'; % Taxonomicon
metaData.links.id_WoRMS = '281098'; % WoRMS
metaData.links.id_fishbase = 'Hyperprosopon-anale'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hyperprosopon_anale}}';
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
bibkey = 'BaltKnig1983'; type = 'Article'; bib = [ ... 
'author = {Baltz, D.M. and E.E. Knight}, ' ... 
'year = {1983}, ' ...
'title = {Age, growth, reproductive characteristics, and seasonal depth distribution of the spotfin surfperch, \emph{Hyperprosopon anale}}, ' ...
'journal = {Calif. Fish Game}, ' ...
'volume = {69}, ' ...
'pages = {97-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hyperprosopon-anale.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
