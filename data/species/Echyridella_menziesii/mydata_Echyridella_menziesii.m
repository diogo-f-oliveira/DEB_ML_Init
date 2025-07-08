function [data, auxData, metaData, txtData, weights] = mydata_Echyridella_menziesii
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Hyriidae';
metaData.species    = 'Echyridella_menziesii'; 
metaData.species_en = 'New Zealand freshwater mussel'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wd_L'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 13]; 

%% set data
% zero-variate data

data.am = 50*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Klun2012';   
  temp.am = C2K(16.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for Westralunio carteri';

data.Lp  = 2.75;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
  comment.Lp = '2.5 till 3 cm for Westralunio carteri';
data.Li  = 7.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Jame1985';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'nzgeo';
  comment.Wwb = 'Based on 0.3 mm glochidium length, but rather flat: 0.5*4/3*pi*0.015^3; actually length 360 mum, height 280 mum ';
data.Wd55 = 0.637; units.Wd55 = 'g';   label.Wd55 = 'dry weight at shell length 55 mm';   bibkey.Wd55 = 'Jame1985';
  comment.Wd55 = 'Based on Wd (in g) = 1.13e-5*(shell length in mm)^2.73';
  
data.Ri  = 1000; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
 1	1.195
 2	2.109
 3	2.787
 4	3.375
 5	3.839
 6	4.191
 7	4.633
 8	5.019
 9	5.382
10	5.622
11	5.828
12	6.146];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jame1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Glochidium is here not assumed to extract nutrients from the host fish';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Uses the k?aro (Galaxias brevipinnis) to cling its glochidia larvae (glochidia) and to metamorphose';
metaData.bibkey.F1 = {'Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DWJ2'; % Cat of Life
metaData.links.id_ITIS = '983814'; % ITIS
metaData.links.id_EoL = '4752438'; % Ency of Life
metaData.links.id_Wiki = 'Echyridella_menziesii'; % Wikipedia
metaData.links.id_ADW = 'Hyridella_menziesi'; % ADW
metaData.links.id_Taxo = '3405471'; % Taxonomicon
metaData.links.id_WoRMS = '819815'; % WoRMS
metaData.links.id_molluscabase = '819815'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Echyridella_menziesii}}';
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
bibkey = 'Jame1985'; type = 'Article'; bib = [ ... 
'author = {M. R. James}, ' ... 
'year = {1985}, ' ...
'title = {Distribution, biomass and production of the freshwater mussel, \emph{Hyridella menziesi} ({G}ray), in {L}ake {T}aupu, {N}ew {Z}ealand}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {15}, ' ...
'pages = {307--314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wldb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wldb.ilec.or.jp/data/databook_html/oce/oce-01.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nzgeo'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nzgeo.com/stories/what-is-killing-the-kakahi/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Klun2012'; type = 'PhDthesis'; bib = [ ... 
'author = {M. W. Klunzinger}, ' ... 
'year = {2012}, ' ...
'title = {Ecology, life history and conservation status of \emph{Westralunio carteri} {I}redale 1934, an endemic freshwater mussel of {S}outh-{W}estern {A}ustralia}, ' ...
'school = {Murdoch University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

