function [data, auxData, metaData, txtData, weights] = mydata_Pisidium_amnicum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Sphaeriida'; 
metaData.family     = 'Sphaeriidae';
metaData.species    = 'Pisidium_amnicum'; 
metaData.species_en = 'Greater European peaclam'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 24]; 

%% set data
% zero-variate data

data.am = 17*30.5; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoutDauf2008';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.006; units.Lb  = 'cm';  label.Lb  = 'shell length at emergence';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Sphaerium corneum';
data.Lj  = 0.22; units.Lj  = 'cm';  label.Lj  = 'shell length at emergence';   bibkey.Lj  = 'MoutDauf2008';
data.Lp  = 0.456; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty';    bibkey.Lp  = 'MoutDauf2008';
data.Li  = 1.66; units.Li  = 'cm';  label.Li  = 'ultimate shell height';       bibkey.Li  = 'MoutDauf2008';

data.Wdi  = 0.091; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'HoloHans1986';
 comment.Wdi = 'based on length-AFDW for P. casertanum: (-0.003 + 0.271*16.6)^3/1000';

data.Ni  = 13*20;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'HoloHans1986';   
  temp.Ni = C2K(13);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '3-37 eggs per clutch, 5-41 clutches per life time';

% uni-variate data
% time-length
data.tL = [ ... % time since emergence (d) , shell length (cm)
41.479	0.304
73.598	0.444
114.107	0.544
137.619	0.677
166.039	0.641
200.699	0.714
232.587	0.805
269.759	0.805
364.277	0.838
393.059	0.878
421.508	0.848
458.955	0.905
490.365	0.896
519.132	0.933];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoutDauf2008';
comment.tL = 'Data from Saone river, cohort 1998';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Lj = 3 * weights.Lj;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Larvae of 2.2 mm shell length leave mantle in April';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This shell is hermaproditic; eggs are brooded for 9-10 month';
metaData.bibkey.F1 = 'nas';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4J8NR'; % Cat of Life
metaData.links.id_ITIS = '81401'; % ITIS
metaData.links.id_EoL = '395905'; % Ency of Life
metaData.links.id_Wiki = 'Pisidium_amnicum'; % Wikipedia
metaData.links.id_ADW = 'Pisidium_amnicum'; % ADW 
metaData.links.id_Taxo = '39597'; % Taxonomicon
metaData.links.id_WoRMS = '594808'; % WoRMS 
metaData.links.id_molluscabase = '594808'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pisidium_amnicum}}';
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
bibkey = 'MoutDauf2008'; type = 'Article'; bib = [ ... 
'doi = {10.1051/limn:2008008}, ' ...
'author = {J. Mouthon and M. Daufresne}, ' ... 
'year = {2008}, ' ...
'title = {Population dynamics and life cycle of \emph{Pisidium amnicum} ({M}\"{u}ller) ({B}ivalvia: {S}phaeriidae) and \emph{Valvata piscinalis} ({M}\"{u}ller) ({G}astropoda: {P}rosobranchia) in the Sa\^{o}ne river, a nine-year study}, ' ...
'journal = {Ann. Limnol. - Int. J. Lim.}, ' ...
'volume = {44 (4)}, ' ...
'pages = {241-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nas'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nas.er.usgs.gov/queries/FactSheet.aspx?SpeciesID=129}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoloHans1986'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1600-0587.1986.tb01195.x}, ' ...
'author = {Ismo J. Holopainen and Ilkka Hanski}, ' ... 
'year = {1986}, ' ...
'title = {Life History Variation in \emph{Pisidium} ({B}ivalvia: {P}isidiidae)}, ' ...
'journal = {Holarctic Ecology}, ' ...
'volume = {9(2)}, ' ...
'pages = {85-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
