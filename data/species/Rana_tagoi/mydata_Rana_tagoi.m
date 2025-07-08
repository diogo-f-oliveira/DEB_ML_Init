function [data, auxData, metaData, txtData, weights] = mydata_Rana_tagoi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_tagoi'; 
metaData.species_en = 'Tago''s brown frog';

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 06 13];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Rana muscosa';
data.tj = 0.4*365;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KusaFuku1995';
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2.9*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'KusaFuku1995';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.7*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'KusaFuku1995';
  temp.tpm = C2K(7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.74;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'KusaFuku1995';
data.Li  = 4.42;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'KusaFuku1995';
data.Lim  = 4.22;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'KusaFuku1995';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwi = 20.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Rana muscosa: (4.42/6.8)^3*76';
data.Wwim = 18.2;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwi = 'based on length-weight of Rana muscosa: (4.22/6.8)^3*76';

data.Ri  = 200/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rana muscosa';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.400	0.730
1.000	1.434
1.974	3.227
2.078	4.122
3.070	4.476
4.096	4.524];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KusaFuku1995';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
1.887	4.130
2.887	4.300
3.896	4.541];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KusaFuku1995';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6WQX6'; % Cat of Life
metaData.links.id_ITIS = '665426'; % ITIS
metaData.links.id_EoL = '332961'; % Ency of Life
metaData.links.id_Wiki = 'Rana_tagoi'; % Wikipedia
metaData.links.id_ADW = 'Rana_tagoi'; % ADW
metaData.links.id_Taxo = '146014'; % Taxonomicon
metaData.links.id_WoRMS = '1524209'; % WoRMS
metaData.links.id_amphweb = 'Rana+tagoi'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_tagoi}}';
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
bibkey = 'KusaFuku1995'; type = 'Article'; bib = [ ... 
'author = {Tamotsu Kusano and Kinji Fukuyama and Noriko Miyashita}, ' ... 
'year = {1995}, ' ...
'title = {Body Size and Age Determination by Skeletochronology of the Brown Frog \emph{Rana tagoi tagoi} in {S}outhwestern {K}anto}, ' ...
'journal = {Japanese Journal of Herpetology}, ' ...
'volume = {16(2)}, ' ...
'pages = {29-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+tagoi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

