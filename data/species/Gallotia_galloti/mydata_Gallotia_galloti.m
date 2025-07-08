function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_galloti

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_galloti'; 
metaData.species_en = 'Gallot''s lizard'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1    = {'Urtzi Enriquez-Urzelai'};    
metaData.date_mod_1 = [2021 05 26];              
metaData.email_mod_1     = {'urtzi.enriquez@gmail.com'};            
metaData.address_mod_1   = {'Czech Academy of Sciences'};

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2021 05 28];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'CastBaez1988';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'CastBaez1988';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'CastBaez1988';  
data.Lp  = 7.7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 8.1;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 10.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 12.2;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Ww0 = 1.63;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of egg'; bibkey.Ww0 = 'MoliRodr2004';
  comment.Ww0 = 'data for G. galloti eisentrauti';
data.Wwb = 1.16;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'MoliRodr2004';
  comment.Wwb = 'data for G. galloti galloti';
data.Wwi = 20.72;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Vern1995';
  comment.Wwi = 'Mean body mass of females in May-June';
data.Wwim = 34.43;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'Vern1995';
  comment.Wwim = 'Mean body mass of males in May-June';

data.Ri  = 2.95/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% t-L data
data.tL = [ ... % time since birth (yr), SVL (cm)
0.027	4.497
0.491	5.360
1.517	6.945
2.446	8.558
3.471	10.283
4.482	9.606
5.467	10.995
6.500	11.323
7.484	13.020];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastBaez1988';
comment.tL = 'Data for mixed sexes';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
D2 = 'Temperatures are guessed';
D3 = 'Data are for G. galloti galloti and G. galloti eisentrauti (impossible to split since tL data is a mixed of subspecies)';
D4 = 'Difference to previous entry: added Lpm, Lim, Ww0 and Wwh';
D5 = 'Difference to previous entry: changed Lp and Lim (not consistent with the sexual dimorphism in favor of males (MoliRodr2004)); changed Ri (largely overestimated according to MoliRodr2004); changed Wwi (it was estimated previously)';
D6 = 'All the new data added is for G. galloti galloti, except Ww0 for G. galloti eisentrauti';
D7 = 'Difference to previous entry: Parameter values result in k of around 0.7 with  pseudodata k_J = 0.002 1/d';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6, 'D7',D7);

%% Links
metaData.links.id_CoL = '3F6ZM'; % Cat of Life
metaData.links.id_ITIS = '1155243'; % ITIS
metaData.links.id_EoL = '1056890'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_galloti'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_galloti'; % ADW
metaData.links.id_Taxo = '642475'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gallotia&species=galloti'; % ReptileDB
metaData.links.id_AnAge = 'Gallotia_galloti'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallotia_galloti}}';
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
bibkey = 'CastBaez1988'; type = 'Article'; bib = [ ... 
'author = {J. Castanet and M. Baez}, ' ... 
'year = {1988}, ' ...
'title = {Data on age and longevity in \emph{Gallotia galloti} ({S}auria, {L}acertidae) assessed by skeletochronology}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {1}, ' ...
'pages = {218-222}'];
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
bibkey = 'Vern1995'; type = 'Article'; bib = [ ... 
'author = {R. Vernet and J. Castanet and M. Baez}, ' ... 
'year = {2004}, ' ...
'title = {Comparative water flux and daily energy expenditure of lizards of the genus {G}allotia ({L}acertidae) from the {C}anary {I}slands}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {16}, ' ...
'pages = {55-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

