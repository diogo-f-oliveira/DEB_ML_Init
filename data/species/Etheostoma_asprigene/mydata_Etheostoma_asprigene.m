  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_asprigene
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_asprigene'; 
metaData.species_en = 'Mud darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
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
data.tp = 1*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'CummGrad1984';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'CummGrad1984';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.2;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'CummGrad1984'; 
data.Li = 5.5;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'CummGrad1984';
  comment.Li = 'based on tL data';

data.Wwb = 6.3e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CummGrad1984';
  comment.Wwb = 'based on egg diameter of 1.06 mm: pi/6*0.106^3';
data.Wwi = 1.7;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = {'CummGrad1984','fishbase'};
  comment.Wwi = 'based on 0.00513*(5.5/0.87)^3.14, see F1, F2';
 
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.326	2.621
0.402	2.804
0.647	3.022
0.723	3.103
0.803	3.176
0.879	3.588
0.959	3.376
1.288	3.805
1.356	3.877
1.521	4.004
1.680	4.581
1.766	4.186
1.841	4.570
1.926	4.505
2.002	4.605
2.412	4.886
2.492	4.876
2.572	4.985
2.644	5.067
2.730	4.690
2.809	4.974
2.978	5.083];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CummGrad1984';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.235	1.713
0.331	2.520
0.393	2.886
0.498	3.280
0.553	3.573
0.639	2.957
0.710	3.333
0.799	3.103
0.896	3.395
0.963	3.441
1.039	3.917
1.191	3.659
1.268	3.658
1.352	3.777
1.441	3.849
1.516	4.050
1.610	3.948
1.681	4.388
1.761	4.406
1.841	4.653
1.926	4.386
2.006	4.706
2.402	5.262
2.480	4.775
2.569	4.765
2.648	5.187
2.725	4.902
2.809	5.185
2.881	5.295
2.982	5.486];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CummGrad1984';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % std length (cm), mature ova (#)
3.3 72
3.7 154
3.9 185
3.9 94
3.9 151
4.0 140
4.0 95
4.1 183
4.6 180
4.7 267
4.8 148
5.3 346];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CummGrad1984';

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
F1 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL23'; % Cat of Life
metaData.links.id_ITIS = '168372'; % ITIS
metaData.links.id_EoL = '994969'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_asprigene'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_asprigene'; % ADW
metaData.links.id_Taxo = '174065'; % Taxonomicon
metaData.links.id_WoRMS = '1045010'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-asprigene'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_asprigene}}';  
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
bibkey = 'CummGrad1984'; type = 'Techreport'; bib = [ ... 
'author = {Kevin S. Cummings and James M. Grady and Brooks M. Burr}, ' ...
'year = {1984}, ' ...
'title = {The life history of the mud darter, \emph{Etheostoma asprigene}, in {L}ake {C}reek, {I}llinois}, ' ... 
'institution = {Dept Energy and Natural Resources}, ' ...
'series = {Biological notes}, ' ...
'volume = {122}, ' ...
'pages = {471-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-asprigene.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
