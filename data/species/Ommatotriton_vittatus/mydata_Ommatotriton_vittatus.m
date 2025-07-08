function [data, auxData, metaData, txtData, weights] = mydata_Ommatotriton_vittatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Ommatotriton_vittatus'; 
metaData.species_en = 'Southern banded newt'; 

metaData.ecoCode.climate = {'Csa', 'Dsa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp 
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';           bibkey.tp = 'Altu2018';
  temp.tp = C2K(19);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';           bibkey.tpm = 'Altu2018';
  temp.tpm = C2K(19); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Altu2018';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 1;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Neurergus kaiseri ';
data.Li  = 4.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Altu2018';
data.Lim = 5.1;    units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'Altu2018';

data.Wwi = 1.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
   comment.Wwi = 'based on Triturus cristatus:(4.8/8.4)^3*9.4';
data.Wwim = 2.1;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'guess';
   comment.Wwim = 'based on Triturus cristatus: (5.1/8.4)^3*9.4';

data.Ri  = 50/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Neurergus kaiseri' ;

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.015	2.162
4.013	4.450
4.043	4.080
5.017	4.267
5.017	4.348
5.032	4.522
5.032	4.834
5.990	4.640
6.020	5.137
6.020	4.316
6.050	4.698
6.978	4.515
6.993	4.492
7.023	4.723
7.023	5.243
8.012	4.841];
data.tL_f(:,1) = (0.75 + data.tL_f(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Altu2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.001	2.159
3.008	4.179
3.011	4.905
3.994	4.373
3.995	4.521
3.996	4.634
4.979	4.329
4.981	4.794
5.993	4.523
5.994	4.659
5.995	4.750
5.996	4.920
5.997	4.988
5.998	5.044
5.999	5.339
6.010	4.591
6.012	5.203
6.013	5.271
7.011	5.057
7.013	5.420
7.040	4.978
7.997	5.194
8.011	5.024];
data.tL_m(:,1) = (0.75 + data.tL_m(:,1)) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Altu2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 *  weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6SLSK'; % Cat of Life
metaData.links.id_ITIS = '775931'; % ITIS
metaData.links.id_EoL = '1019471'; % Ency of Life
metaData.links.id_Wiki = 'Ommatotriton_vittatus'; % Wikipedia
metaData.links.id_ADW = 'Ommatotriton_vittatus'; % ADW
metaData.links.id_Taxo = '985981'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ommatotriton+vittatus'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ommatotriton_vittatus}}';
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
bibkey = 'Altu2018'; type = 'article'; bib = [ ...
'doi = {10.13128/Acta_Herpetol-21171}, ' ...
'author = {Abdullah Altuni\c{s}ik}, ' ... 
'year = {2018}, ' ...
'title = {The first demographic data and body size of the southern banded newt, \emph{Ommatotriton vittatus} ({C}audata: {S}alamandridae)}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {13(1)}, ' ...
'pages = {13-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

