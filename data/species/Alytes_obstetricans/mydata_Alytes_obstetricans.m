function [data, auxData, metaData, txtData, weights] = mydata_Alytes_obstetricans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Alytidae';
metaData.species    = 'Alytes_obstetricans'; 
metaData.species_en = 'Common midwife toad'; 

metaData.ecoCode.climate = {'BSk','Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 23];

%% set data
% zero-variate data

data.ab = 4.5*7;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3-6 weeks';
data.tj = 365+8*7;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1.5*365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'ADW';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth of tadpoles';  bibkey.Lb  = 'ADW';
data.Ljb  = 6.5;  units.Ljb  = 'cm'; label.Ljb  = 'total length at metam of tadpoles'; bibkey.Ljb  = 'ADW';
  comment.Ljb = '5-8 cm';
data.Lj  = 3;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam of toads';      bibkey.Lj  = 'amphibiaweb';
data.Li  = 5.0;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'ADW';
data.Lim  = 4.2; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'ADW';

data.Wwb = 0.0335; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 5.0;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'nlsoorten';
  comment.Wwi = 'based on Alytes obstetricans of 5 cm, 9 g: (4.1/5)^3*9';
data.Wwim = 4.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'nlsoorten';
  comment.Wwim = 'based on Alytes obstetricans of 5 cm, 9 g: (3.9/5)^3*9';

data.Ri  = 45/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '45 eggs per clutch, 4 clutches per year'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time (yr), body length (cm): females, males
    1 NaN   3.794
    2 4.302 4.083
    3 4.703 4.377
    4 5.179 4.709
    5 5.461 NaN
    6 5.699 5.048
    7 5.762 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)) * 365; % convert yr to d since metam
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MarqEstb1997'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.Ljb = 0 * weights.Ljb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Tadpoles are growing faster than toads';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Males carry eggs around hind legs of several females';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CCWK'; % Cat of Life
metaData.links.id_ITIS = '662327'; % ITIS
metaData.links.id_EoL = '330761'; % Ency of Life
metaData.links.id_Wiki = 'Alytes_obstetricans'; % Wikipedia
metaData.links.id_ADW = 'Alytes_obstetricans'; % ADW
metaData.links.id_Taxo = '47526'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Alytes+obstetricans'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alytes_obstetricans}}';
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
bibkey = 'MarqEstb1997'; type = 'Article'; bib = [ ... 
'author = {Rafael M\''{a}rquez and Marisa Esteban and Jacques Castanet}, ' ... 
'year = {1997}, ' ...
'title = {Sexual Size Dimorphism and Age in the Midwife Toads \emph{Alytes obstetricans} and \emph{A. cisternasii}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {31(1)}, ' ...
'pages = {52-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/330761/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alytes_obstetricans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Alytes+obstetricans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
