function [data, auxData, metaData, txtData, weights] = mydata_Potomida_littoralis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Potomida_littoralis'; 
metaData.species_en = 'Black river mussel'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Ri'; 'Wwi'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 06];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 80*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'PouRCamp2015';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03; units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Nage2004';
  comment.Lp = 'based on tp = 4-5 yr and tL data';
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'PouRCamp2015';

data.Wwi  = 36; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(10/7.3)^3';
  
data.Ri = 1e5/365;    units.Ri = '#/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
  
% time-length
data.tL = [ ... % time since settlement (yr), shell length (cm)
13.210	4.115
14.397	4.135
20.225	4.175
21.418	4.692
24.660	5.129
28.111	4.911
28.656	5.487
29.300	5.129
30.055	5.129
30.273	5.308
32.864	5.427
34.694	4.950
34.916	5.507
36.963	5.209
38.694	5.606
39.024	6.223
39.127	5.805
40.005	7.137
40.204	5.567
42.054	6.998
42.814	7.396
43.016	6.103
43.022	6.660
43.023	6.839
44.851	6.223
44.968	7.078
46.363	6.342
48.201	6.660
48.757	8.191
51.010	6.938
52.737	6.978
53.182	8.231
58.904	8.429
59.208	6.600
60.195	8.072
61.822	8.827
63.018	9.662
63.117	8.827
70.992	8.608
79.200	9.205];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PouRCamp2015';
comment.tL = 'Data from Low Ter flood plain Banyoles Lake, Catalonia; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4M6YJ'; % Cat of Life
metaData.links.id_ITIS = '984016'; % ITIS
metaData.links.id_EoL = '3013556'; % Ency of Life
metaData.links.id_Wiki = 'Unionidae'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3405663'; % Taxonomicon
metaData.links.id_WoRMS = '1067375'; % WoRMS
metaData.links.id_molluscabase = '1067375'; % molluscabase

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
bibkey = 'PouRCamp2015'; type = 'misc'; bib = [ ...
'author = {Quim Pou-Rovira and Miquel Campos and Carles Feo-Quer and Irenne Camos and Jordi Marti and Irenne Angelats and Cristina Cros and Eloi Cruset and Albert Canal and Montse Hern\''{a}ndez and Mario Rodr\''{i}guez}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth and demography of several populations of \emph{Potomida littoralis} in northeast of {C}atalonia}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/284826597_Age_growth_and_demography_of_several_populations_of_Potomida_littoralis_in_northeast_of_Catalonia/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nage2004'; type = 'Article'; bib = [ ...
'author = {Karl-Otto Nagel}, ' ... 
'year = {2004}, ' ...
'title = {Observations on the reproductive period of the freshwater mussel \emph{Potomida littoralis} ({U}nionidae)}, ' ...
'journal = {Iberus}, ' ...
'volume = {22(2)}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

