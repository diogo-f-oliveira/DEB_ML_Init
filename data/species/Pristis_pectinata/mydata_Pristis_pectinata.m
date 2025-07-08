function [data, auxData, metaData, txtData, weights] = mydata_Pristis_pectinata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Pristidae';
metaData.species    = 'Pristis_pectinata'; 
metaData.species_en = 'Smallthooth sawfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 25];                           
metaData.emailmod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.ab = 5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Ichtyology';    
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp of all data is guessed; ab = for P. microdon';
data.ap = 6.2*365; units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'estimated';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'interpolated from tL-data';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'NOAA';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge for P perotteti';

data.Lb  = 70;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'SimpPoul2008';
data.Lp  = 360;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'SimpPoul2008'; % for females
 comment.Lp = 'for females, 270 d for males';
data.Li  = 760;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwi = 350000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'NOAA';

data.Ri  = 17/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki 15-20 pubs per clutch; possibily 1 clutch per 2 yr, AnAge for P perotteti';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), length (cm)
0.417	57.621
0.835	148.699
1.141	167.286
1.224	189.591
1.391	128.253
1.781	223.048
1.837	195.167
1.948	195.167
2.004	243.494
5.315	302.974
9.017	434.944
10.186	416.357
10.826	379.182
14.082	436.803];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SchaPatt2012';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.ap = 0 * weights.ap;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'mod_1: predicted age at birth is much larger than "observed"';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4MK2S'; % Cat of Life
metaData.links.id_ITIS = '160809'; % ITIS
metaData.links.id_EoL = '46560360'; % Ency of Life
metaData.links.id_Wiki = 'Pristis_pectinata'; % Wikipedia
metaData.links.id_ADW = 'Pristis_pectinata'; % ADW
metaData.links.id_Taxo = '42016'; % Taxonomicon
metaData.links.id_WoRMS = '105848'; % WoRMS
metaData.links.id_fishbase = 'Pristis-pectinata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristis_pectinata}}'; 
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
bibkey = 'SchaPatt2012'; type = 'Article'; bib = [ ...  
'author = {Scharer, R. M. and Patterson III, W. F. and Carlson, J. K. and Poulakis, G. R.}, ' ...
'year = {2012}, ' ...
'title  = {Age and Growth of Endangered Smalltooth Sawfish (\emph{Pristis pectinata}) Verified with {L}{A}-{I}{C}{P}-{M}{S} Analysis of Vertebrae}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {7(10)}, ' ...
'doi = {10.1371/journal.pone.0047850}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SimpPoul2008'; type = 'Article'; bib = [ ...  
'author = {Simpfendorfer, C. A. and Poulakis, G. R. and O Donnell, P. M.}, ' ...
'year = {2008}, ' ...
'title  = {Growth rates of juvenile smalltooth sawfish \emph{Pristis pectinata} {L}atham in the {W}estern {A}tlantic.}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {72}, ' ...
'pages = {711-723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pristis_perotteti}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ichthyology'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/KTSawfish/KTSawfish.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NOAA'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nmfs.noaa.gov/pr/species/fish/smalltoothsawfish.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 