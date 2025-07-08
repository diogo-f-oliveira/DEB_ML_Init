function [data, auxData, metaData, txtData, weights] = mydata_Pleuragramma_antarcticum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Pleuragramma_antarcticum'; 
metaData.species_en = 'Antarctic silverfish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0.2); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'}; 
metaData.date_subm   = [2018 07 22]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 17];

%% set data
% zero-variate data

data.tp = 8*365;    units.tp = 'd';   label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(0.5); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '7 till 9 yr';
data.am = 25*365;    units.am = 'd';   label.am = 'life span';                   bibkey.am = 'HuboTomo1989';   
  temp.am = C2K(0.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 30.8;    units.Li  = 'cm'; label.Li  = 'ultimate standard length';   bibkey.Li  = 'HuboTomo1989';

data.Wwb = 3.6e-3;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.9 mm: pi/6*0.19^3';
data.Wwi = 171;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'HuboTomo1989';
  comment.Wwi = 'based on F1 for Li'; 

data.Ri  = 1100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reproduction rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(0.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'fecundity range 4315-17774';

% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
1.303	4.949
1.343	4.119
2.266	6.971
2.306	6.180
3.270	7.767
3.390	7.966
4.273	9.157
4.313	9.394
5.316	10.150
5.316	11.100
6.279	11.895
6.279	12.093
7.322	13.166
7.322	13.364
8.366	14.556
8.366	14.793
9.249	15.588
9.329	16.024
10.212	17.175
10.573	17.019
11.375	17.418
11.656	17.459
12.339	19.321
12.379	17.977
13.382	18.179
14.345	21.981];  
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(0.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HuboTomo1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males and females are assumed to have the same parameters';
D2 = 'temperature is guessed';
D3 = 'mod_1: kap increased, Ri and T_A reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'TL(cm) = 1.092 - SL(cm) + 0.284 (Hubold 1984); W(g) = 0.00170 - SL(cm)^3.36';
metaData.bibkey.F1 = 'HuboTomo1989'; 
F2 = 'Planktivorous';
metaData.bibkey.F2 = 'HuboTomo1989'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6VPXN'; % Cat of Life
metaData.links.id_ITIS = '642933'; % ITIS
metaData.links.id_EoL = '46573000'; % Ency of Life
metaData.links.id_Wiki = 'Pleuragramma_antarcticum'; % Wikipedia
metaData.links.id_ADW = 'Pleuragramma_antarcticum'; % ADW
metaData.links.id_Taxo = '184146'; % Taxonomicon
metaData.links.id_WoRMS = '712788'; % WoRMS
metaData.links.id_fishbase = 'Pleuragramma-antarctica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pleuragramma_antarcticum}}';
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
bibkey = 'HuboTomo1989'; type = 'Article'; bib = [ ... 
'author = {G. Hubold and A. P. Tomo}, ' ... 
'year = {1989}, ' ...
'title = {Age and Growth of {A}ntarctic Silverfish \emph{Pleuragramma antarcticum} {B}oulenger, 1902, from the {S}outhern {W}eddell {S}ea and {A}ntarctic {P}eninsula}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {9}, ' ...
'pages = {205--212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pleuragramma-antarctica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
