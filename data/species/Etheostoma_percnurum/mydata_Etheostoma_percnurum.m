  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_percnurum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_percnurum'; 
metaData.species_en = 'Duskytail darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

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
data.tp = 1*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Laym1991';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Laym1991';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Laym1991'; 
data.Li = 5;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'Laym1991';
  comment.Li = 'based on tL data';

data.Wwb = 1.15e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Laym1991';
  comment.Wwb = 'based on egg diameter of 2.8 mm: pi/6*0.28^3';
data.Wwi = 1.24;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Laym1991';
  comment.Wwi = 'based on 0.00513*(5/0.87)^3.14, see F1, F2';

data.Ri = 189/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Laym1991';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 7 clutches per yr, 27 eggs per clutch';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.238	2.102
0.327	2.831
0.492	2.902
0.744	3.115
0.830	2.920
0.912	3.302
0.992	4.032
1.072	3.519
1.240	3.821
1.330	3.915
1.490	4.237
1.747	4.305
1.920	4.405
1.997	4.721];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Laym1991';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), std length (cm)
0.154	1.815
0.236	2.410
0.322	3.110
0.493	3.422
0.742	3.520
0.829	3.623
0.910	3.823
0.991	4.610
1.077	4.299
1.326	4.724
1.405	4.933
1.493	4.545
1.911	5.244
1.998	5.125];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Laym1991';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  10 * weights.tL_f;
weights.tL_m =  10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  3 * weights.psd.v;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length from photo: SL = 0.87 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6GT4S'; % Cat of Life
metaData.links.id_ITIS = '553380'; % ITIS
metaData.links.id_EoL = '210691'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_percnurum'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_percnurum'; % ADW
metaData.links.id_Taxo = '174133'; % Taxonomicon
metaData.links.id_WoRMS = '1010910'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-percnurum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_percnurum}}';  
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
bibkey = 'Laym1991'; type = 'Article'; bib = [ ... 
'author = {Steven R. Layman}, ' ...
'year = {1991}, ' ...
'title = {Life History of the Relict, Duskytail Darter, \emph{Etheostoma} (\emph{Catonotus}) sp., in {L}ittle {R}iver, {T}ennessee}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1991}, ' ...
'pages = {471-485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-percnurum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
