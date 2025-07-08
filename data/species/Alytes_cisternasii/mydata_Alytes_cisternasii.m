function [data, auxData, metaData, txtData, weights] = mydata_Alytes_cisternasii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Alytidae';
metaData.species    = 'Alytes_cisternasii'; 
metaData.species_en = 'Iberian  midwife toad'; 

metaData.ecoCode.climate = {'BSk','Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf', 'jiTg'};
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

data.ab = 4.5*7;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Alytes obstetricans: 3-6 weeks';
data.tj = 125;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '110 to 140 d';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'guess';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Alytes obstetricans';

data.Lb  = 1.3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth of tadpoles';  bibkey.Lb  = 'amphibiaweb';
data.Ljb  = 7;  units.Ljb  = 'cm'; label.Ljb  = 'total length at metam of tadpoles'; bibkey.Ljb  = 'Wiki';
data.Lj  = 3.0;   units.Lj  = 'cm';  label.Lj  = ' SVL for females at metam';   bibkey.Lj  = 'guess';
  comment.Lj = 'based on tL data';
data.Li  = 3.858;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MarqEstb1997';
  comment.Li = 'amphibiaweb: 4.2 cm';
data.Lim  = 3.579; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'MarqEstb1997';
  comment.Lim = 'amphibiaweb: 3.6 cm';

data.Wwb = 0.0224; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2.6-3.5mm, which grow to 4.3-4.4mm by uptake of water: pi/6*0.35^3';
data.Wwi = 4.13;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Alytes obstetricans of 5 cm, 9 g: (3.858/5)^3*9';
data.Wwim = 3.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Alytes obstetricans of 5 cm, 9 g: (3.579/5)^3*9';

data.Ri  = 180/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '45 eggs per clutch, 4 clutches per yr'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time (yr), body length (cm): females, males
    1 3.356 3.300
    2 3.732 3.569
    3 3.829 3.692
    4 4.056 3.671
    6 4.157 3.965];	
data.tL_fm(:,1) = (data.tL_fm(:,1)) * 365; % convert yr to d since metam
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MarqEstb1997'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Ljb = 0 * weights.Ljb;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 0 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.p_M = 5 * weights.psd.p_M;
% weights.psd.kap = 3 * weights.psd.kap;
% weights.psd.v   = 3 * weights.psd.v;

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
D3 = 'amphibiaweb states that tadpoles grow from 1.8 to 7.6 cm in a few weeks, but most tadpoles do overwinter (pers. com. Samuel Pinya Fernandez)';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Males carry eggs around hind legs of several females';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5TXLQ'; % Cat of Life
metaData.links.id_ITIS = '662323'; % ITIS
metaData.links.id_EoL = '1037743'; % Ency of Life
metaData.links.id_Wiki = 'Alytes_cisternasii'; % Wikipedia
metaData.links.id_ADW = 'Alytes_cisternasii'; % ADW
metaData.links.id_Taxo = '47526'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Alytes+cisternasii'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alytes_cisternasii}}';
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
'howpublished = {\url{http://eol.org/pages/1037743/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Alytes+cisternasii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
