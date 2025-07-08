function [data, auxData, metaData, txtData, weights] = mydata_Aphanius_anatoliae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Cyprinodontidae';
metaData.species    = 'Aphanius_anatoliae'; 
metaData.species_en = 'Anatolian giant killifish'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2020 10 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 5 * 365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'GuclTurn2007';   
  temp.am = C2K(17.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 2 mnth and tL data';
data.Li  = 5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwi = 1.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi=  'based on 0.00977*Li^3.26, see F1';
  
data.Ri  = 300/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
temp.Ri = C2K(17.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... %  year class (yr), total length (cm)
    0 1.80
    1 2.70
    2 3.55
    3 4.10
    4 4.55];
data.tL_f(:,1) = 365 * (0.9 + data.tL_f(:,1)); % covert mnth to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female'};  
temp.tL_f    = C2K(17.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GuclTurn2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... %  year class (yr), total length (cm)
    0 1.75
    1 2.75
    2 3.15
    3 3.90];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1)); % covert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male'};  
temp.tL_m    = C2K(17.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GuclTurn2007';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
1.413	0.053
1.421	0.034
1.589	0.041
1.713	0.094
1.750	0.043
1.793	0.082
1.806	0.056
1.853	0.105
1.854	0.082
1.878	0.071
1.910	0.067
1.925	0.248
1.926	0.090
1.954	0.076
1.958	0.110
1.982	0.056
2.006	0.129
2.006	0.099
2.026	0.061
2.058	0.080
2.090	0.097
2.138	0.125
2.142	0.093
2.190	0.074
2.210	0.131
2.246	0.108
2.258	0.138
2.326	0.121
2.350	0.151
2.354	0.191
2.378	0.153
2.430	0.172
2.450	0.189
2.546	0.187
2.589	0.305
2.622	0.179
2.626	0.220
2.701	0.424
2.729	0.335
2.738	0.307
2.806	0.260
2.814	0.324
2.826	0.290
2.898	0.297
2.905	0.365
2.938	0.327
2.973	0.450
3.021	0.512
3.046	0.265
3.090	0.395
3.105	0.438
3.117	0.617
3.117	0.530
3.149	0.449
3.170	0.408
3.205	0.438
3.245	0.598
3.246	0.400
3.277	0.521
3.309	0.551
3.382	0.438
3.405	0.677
3.465	0.699
3.481	0.620
3.537	0.622
3.561	0.643
3.601	0.690
3.620	0.886
3.669	0.778
3.756	0.857
3.789	0.823
3.864	1.008
3.936	0.863];
units.LWw = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'GuclTurn2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males as supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977 * (TL in cm)^3.26';
metaData.bibkey.F1 = 'fishbase';
F2 = 'a short-lived species';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'FB4M'; % Cat of Life
metaData.links.id_ITIS = '647059'; % ITIS
metaData.links.id_EoL = '1157165'; % Ency of Life
metaData.links.id_Wiki = 'Aphanius_anatoliae'; % Wikipedia
metaData.links.id_ADW = 'Aphanius_anatoliae'; % ADW
metaData.links.id_Taxo = '44463'; % Taxonomicon
metaData.links.id_WoRMS = '1026457'; % WoRMS
metaData.links.id_fishbase = 'Aphanius-anatoliae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphanius_anatoliae}}';
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
bibkey = 'GuclTurn2007'; type = 'Article'; bib = [ ... 
'doi = {10.1080/09397140.2007.10638228}, ' ...
'author = {Salim Serkan G\"{u}\c{c}l\"{u} and Ismail Ibrahim Turna and Zekiye G\"{u}\c{c}l\"{u} and Iskender G\"{u}lle}, ' ... 
'year = {2007}, ' ...
'title = {Population structure and growth of \emph{Aphanius anatoliae sureyanus} {N}eu, 1937 ({O}steichthyes: {C}yprinodontidae), endemic to {B}urdur {L}ake, {T}urkey}, ' ...
'journal = {Zoology in the Middle East}, ' ...
'volume = {41(1)}, ' ...
'pages = {63-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aphanius-anatoliae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

