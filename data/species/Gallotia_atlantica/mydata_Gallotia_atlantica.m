function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_atlantica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_atlantica'; 
metaData.species_en = 'Atlantic lizard';  

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

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 23*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guessed at 23 months due to similarity to G. caesaris in am';
data.am = 61*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MoliRodr2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '61 months according to MoliRodr2004';

data.Lb  = 2.45;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoliRodr2004';  
data.Lp  = 5.7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 5.95;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 7.3;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 9.6;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Ww0 = 0.6;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of eggs'; bibkey.Ww0 = 'MoliRodr2004';
  comment.Ww0 = 'Body mass of eggs';
data.Wwb = 0.6;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'MoliRodr2004';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 7.8;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Lope2015';
  comment.Wwi = 'ultimate body mass of females';
data.Wwim = 21.0;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Lope2015';
  comment.Wwim = 'ultimate body mass of males';

data.Ri  = 2.49/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

%% set weights for all real data
weights = setweights(data, []);
%weights.Lim = 0.1 * weights.Lim;
%weights.Wwim = 0.1 * weights.Wwim;

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
D2 = 'Data for G. atlantica atlantica';
D3 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3F6ZG'; % Cat of Life
metaData.links.id_ITIS = '1155241'; % ITIS
metaData.links.id_EoL = '1056891'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_atlantica'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_atlantica'; % ADW
metaData.links.id_Taxo = '642473'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gallotia&species=atlantica'; % ReptileDB
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
bibkey = 'MoliRodr2004'; type = 'Article'; bib = [ ... 
'author = {M. Molina-Borja and M.A. Rodriguez-Dominguez}, ' ... 
'year = {2004}, ' ...
'title = {Evolution of biometric and life-history traits in lizards ({G}allotia) from the {C}anary {I}slands}, ' ...
'journal = {J. Zool. Syst. Evol. Research}, ' ...
'volume = {42}, ' ...
'pages = {44-53}'];
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
