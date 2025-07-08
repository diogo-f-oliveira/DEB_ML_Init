function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_bravoana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_bravoana'; 
metaData.species_en = 'La Gomera Giant Lizard';  

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai'};    
metaData.date_subm = [2021 05 26];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2021 06 02];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Mate2007';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 35*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'taken from G. simonyi';
data.am = 133*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'taken from G. simonyi';

data.Lb  = 5.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'Mate2007';  
data.Lp  = 13.1;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'guess';  
data.Li  = 15.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'Noga2001';  
data.Lim  = 19;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'Noga2001';  

data.Ww0 = 6;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of eggs'; bibkey.Ww0 = 'Mate2007';
  comment.Ww0 = 'Body mass of eggs';
data.Wwb = 3.5;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'Mate2007';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 159.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Lope2015';
  comment.Wwi = 'ultimate body mass of females';
data.Wwim = 210.5;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Lope2015';
  comment.Wwim = 'ultimate body mass of males';

data.Ri  = 7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Mate2007';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0.5 * weights.Wwi;
weights.Wwim = 0.5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'All "guesses" correspond to data taken from G. simonyi -- similar ultimate size';
D3 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3F6ZJ'; % Cat of Life
metaData.links.id_ITIS = '1155457'; % ITIS
metaData.links.id_EoL = '1263493'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_bravoana'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_bravoana'; % ADW
metaData.links.id_Taxo = '1685262'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gallotia&species=bravoana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mate2007'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Mateo, J.A.}, ' ...
'year = {2007}, ' ...
'title  = {El lagarto gigante de {L}a {G}omera}, ' ...
'publisher = {Excmo. Cabildo Insular de La Gomera}, ' ...
'pages = {95 pp.}, ' ...
'howpublished = {\url{https://www.lacerta.de/AF/Bibliografie/BIB_5353.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Noga2001'; type = 'Article'; bib = [ ... 
'author = {M. Nogales and J.C. Rando and A. Valido and A. Martin}, ' ... 
'year = {2001}, ' ...
'title = {Discovery of a living giant lizard, genus {G}allotia ({R}eptilia: {L}acertidae), from {L}a {G}omera, {C}anary {I}slands}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {57}, ' ...
'pages = {169-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lope2015'; type = 'Article'; bib = [ ... 
'author = {M. Lopez-Darias and B. Vanhooydonck and R. Cornette and A. Herrel}, ' ... 
'year = {2015}, ' ...
'title = {Sex-specific differences in ecomorphological relationships in lizards of the genus {G}allotia},' ...
'journal = {Functional Ecology}, ' ...
'volume = {29}, ' ...
'pages = {506-514}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

