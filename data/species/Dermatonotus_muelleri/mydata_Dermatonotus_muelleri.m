function [data, auxData, metaData, txtData, weights] = mydata_Dermatonotus_muelleri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Microhylidae';
metaData.species    = 'Dermatonotus_muelleri'; 
metaData.species_en = 'Muller''s termite frog'; 

metaData.ecoCode.climate = {'Am', 'BSh', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg', 'jiTi'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 14];              
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

data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for female';   bibkey.tp = 'StanMara2016';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since metam at puberty  for male'; bibkey.tpm = 'StanMara2016';   
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'StanMara2016';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.88;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                    bibkey.Lj  = 'StanMara2016';
data.Lp  = 7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female';          bibkey.Lp  = 'StanMara2016';
  comment.Lp = 'based on tp = 2 yr and tL_f data';
data.Lpm  = 6.6;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for male';          bibkey.Lpm  = 'StanMara2016';
  comment.Lpm = 'based on tp = 2 yr and tL_m data';
data.Li  = 8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'StanMara2016';
data.Lim  = 7.2; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'StanMara2016';

data.Wwb = 1.3e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'StanMara2016';
  comment.Wwb = 'based on egg diameter of 1.36 mm: pi/6*0.136^3';
data.Wwp = 38.25;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'StanMara2016';
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwpm = 27;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty';              bibkey.Wwpm = 'StanMara2016';
  comment.Wwpm = 'based on (Lpm/Lim)^3 * Wwi';
data.Wwi = 57.1; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'StanMara2016';
  comment.Wwi = 'based on Ww = 52.06 g at SVL = 7.586 cm';
data.Wwim = 35.1; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'StanMara2016';
  comment.Wwim = 'based on Ww = 32.55 g at SVL = 7.02 cm';

data.Ri  = 10611/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = 'StanMara2016';
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (yr), SVL (cm)
0.000	1.873
1.002	5.305
2.004	7.570
2.996	7.592
2.996	7.665
2.996	7.775
3.006	6.845
3.006	7.100
3.006	7.337
3.006	7.556
3.006	8.194
4.008	7.249
4.008	7.851
4.008	8.234
4.018	6.611
4.018	7.523
4.018	7.742
5.010	7.910];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StanMara2016';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since metam (yr), SVL (cm)
0.000	1.891
0.992	5.287
3.006	6.480
3.007	6.662
3.016	7.209
3.017	7.337
3.018	7.483
3.026	6.881
4.008	6.812
4.009	6.921
4.010	6.976
4.018	6.520
4.019	7.450
4.020	7.541
4.028	7.104
5.020	6.980
5.021	7.290];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StanMara2016';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures range from 0 to 40 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '34X5H'; % Cat of Life
metaData.links.id_ITIS = '664549'; % ITIS
metaData.links.id_EoL = '1018796'; % Ency of Life
metaData.links.id_Wiki = 'Dermatonotus_muelleri'; % Wikipedia
metaData.links.id_ADW = 'Dermatonotus_muelleri'; % ADW
metaData.links.id_Taxo = '142308'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Dermatonotus+muelleri'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermatonotus_muelleri}}';
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
bibkey = 'StanMara2016'; type = 'Article'; bib = [ ... 
'author = {Florina St\v{a}nescu and Federico Marangoni and Ivana Reinko and Dan Cog\v{a}lniceanu}, ' ... 
'year = {2016}, ' ...
'title = {Life history traits of a {N}eotropical microhylid (\emph{Dermatonotus muelleri}, {B}oettger 1885) from the {A}rid {C}haco, {A}rgentina}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {26}, ' ...
'pages = {41-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Dermatonotus+muelleri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

