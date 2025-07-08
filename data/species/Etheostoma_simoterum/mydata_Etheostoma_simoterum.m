  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_simoterum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_simoterum'; 
metaData.species_en = 'Snubnose darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-N';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.tp = 0.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'PageMayd1981';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on mature at 1 yr';
data.am = 18*30.5;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'PageMayd1981';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.9;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'PageMayd1981'; 
data.Li = 5.06;   units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'PageMayd1981';
data.Lim = 5.57;  units.Lim = 'cm'; label.Lim = 'ultimate standard length';  bibkey.Lim = 'PageMayd1981';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'Wiki','PageMayd1981'};
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwi = 3.1;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*7.7^3.14, see F1, F2';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.164	2.409
0.260	2.711
0.329	3.276
0.414	4.047
0.506	3.860
0.754	4.201
0.838	4.361
0.915	3.704
1.006	4.447
1.173	4.524
1.247	4.741
1.340	4.573
1.501	4.668];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PageMayd1981';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.170	2.494
0.251	2.805
0.326	3.605
0.420	4.292
0.501	4.264
0.749	4.680
0.830	5.160
0.921	4.043
0.997	4.974
1.173	4.881
1.331	5.146
1.496	5.270];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PageMayd1981';
comment.tL_m = 'Data for males';

% length- weight- fecundity
LWN = [ ... % std length (cm), wet weight (g), mature ova (#)
    4.2 1.44 122
    4.3 1.46 110
    4.3 1.41 144
    4.3 1.53 170
    4.3 1.88 240
    4.5 1.60 128
    4.7 1.75 112
    4.8 2.07 188
    4.9 1.93 128
    5.1 2.52 182];
% 
data.LN = LWN(:,[1 3]);
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PageMayd1981';
%
data.LWw = LWN(:,1:2);
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'PageMayd1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  3 * weights.tL_f;
weights.tL_m =  3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  5 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperature is guessed, but varied between 0 and 27 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL6W'; % Cat of Life
metaData.links.id_ITIS = '168431'; % ITIS
metaData.links.id_EoL = '203736'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_simoterum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_simoterum'; % ADW
metaData.links.id_Taxo = '174152'; % Taxonomicon
metaData.links.id_WoRMS = '1247434'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-simoterum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_simoterum}}';  
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
bibkey = 'PageMayd1981'; type = 'Techreport'; bib = [ ... 
'author = {Lawrence M. Page and Richard L. Mayden}, ' ...
'year = {1981}, ' ...
'title = {The life history of the {T}ennessee snubnose darter, \emph{Etheostoma simoterum}, in {B}ruce {C}reek, {T}essessee}, ' ... 
'institution = {Dept Energy and Natural Resources; Illinois Institute for Natural Resources}, ' ...
'series = {Biological notes}, ' ...
'volume = {77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-simoterum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
