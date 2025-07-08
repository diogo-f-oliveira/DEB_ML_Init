function [data, auxData, metaData, txtData, weights] = mydata_Aspatharia_pfeifferiana
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Iridinidae';
metaData.species    = 'Aspatharia_pfeifferiana'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 11]; 

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BlayYolo1987';
data.Li  = 11.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BlayYolo1987';

data.Wwb = 7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'Based on 306 till 309 mum glochidium length, but rather flat: 0.5*4/3*pi*0.015^3';
data.Wwi = 34; units.Wwi = 'g';   label.Wwi = 'ultimate flesh wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on data for Anadonta cygnea: 22.4*(11.5/10)^3';
  
data.Ri  = 6.3e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';
  
% uni-variate data

% time-length
data.tL_OL = [ ... % time since settlement (yr), shell length (cm)
1	4.482
2	6.771
3	7.834
4	8.778];
data.tL_OL(:,1) = data.tL_OL(:,1) * 365; % convert yr to d 
units.tL_OL   = {'d', 'cm'};  label.tL_OL = {'time since birth', 'shell length', 'Oyun Reservoir, Nigeria'};  
temp.tL_OL    = C2K(21);  units.temp.tL_OL = 'K'; label.temp.tL_OL = 'temperature';
bibkey.tL_OL = 'BlayYolo1987';
comment.tL_OL = 'Data for Oyun Reservoir, Nigeria';
%
data.tL_AR = [ ... % time since settlement (yr), shell length (cm)
1	3.743
2	6.032
3	7.051
4	7.936
5	8.628];
data.tL_AR(:,1) = data.tL_AR(:,1) * 365; % convert yr to d 
units.tL_AR   = {'d', 'cm'};  label.tL_AR = {'time since birth', 'shell length', 'Agbuur River, Nigeria'};  
temp.tL_AR    = C2K(26);  units.temp.tL_AR = 'K'; label.temp.tL_AR = 'temperature';
bibkey.tL_AR = 'BlayYolo1987';
comment.tL_AR = 'Data for Agbuur River, Nigeria';
%
data.tL_OO = [ ... % time since settlement (yr), shell length (cm)
1	3.373
2	5.189
3	6.163
4	6.811];
data.tL_OO(:,1) = data.tL_OO(:,1) * 365; % convert yr to d 
units.tL_OO   = {'d', 'cm'};  label.tL_OO = {'time since birth', 'shell length', 'Odo-Otin River, Nigeria'};  
temp.tL_OO    = C2K(26);  units.temp.tL_OO = 'K'; label.temp.tL_OO = 'temperature';
bibkey.tL_OO = 'BlayYolo1987';
comment.tL_OO = 'Data for Odo-Otin River, Nigeria';
%
data.tL_OR = [ ... % time since settlement (yr), shell length (cm)
1	3.343
2	4.672
3	5.439
4	6.324];
data.tL_OR(:,1) = data.tL_OR(:,1) * 365; % convert yr to d 
units.tL_OR   = {'d', 'cm'};  label.tL_OR = {'time since birth', 'shell length', 'Oyun River, Nigeria'};  
temp.tL_OR    = C2K(26);  units.temp.tL_OR = 'K'; label.temp.tL_OR = 'temperature';
bibkey.tL_OR = 'BlayYolo1987';
comment.tL_OR = 'Data for Oyun River, Nigeria';
%
data.tL_AL = [ ... % time since settlement (yr), shell length (cm)
1	3.107
2	4.509
3	5.380
4	6.013
5	6.410
6	6.763];
data.tL_AL(:,1) = data.tL_AL(:,1) * 365; % convert yr to d 
units.tL_AL   = {'d', 'cm'};  label.tL_AL = {'time since birth', 'shell length', 'Asa Reservoir, Nigeria'};  
temp.tL_AL    = C2K(21);  units.temp.tL_AL = 'K'; label.temp.tL_AL = 'temperature';
bibkey.tL_AL = 'BlayYolo1987';
comment.tL_AL = 'Data for Asa Reservoir, Nigeria';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 3 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_OL', 'tL_AR', 'tL_OO', 'tL_OR', 'tL_AL'}; subtitle1 = {'Data from Oyun Res, Agbuur R, Odo-Otin R, Oyun R, Asa Res'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'HBQ8'; % Cat of Life
metaData.links.id_ITIS = '983917'; % ITIS
metaData.links.id_EoL = '51891317'; % Ency of Life
metaData.links.id_Wiki = 'Aspatharia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1685863'; % Taxonomicon
metaData.links.id_WoRMS = '1058719'; % WoRMS
metaData.links.id_molluscabase = '1058719'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspatharia}}';
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
bibkey = 'BlayYolo1987'; type = 'Article'; bib = [ ... 
'author = {John Blay and Victor Yoloye}, ' ... 
'year = {1987}, ' ...
'title = {Observations on the growth of some populations of the freshwater bivalve \emph{Aspatharia sinuata} ({U}nionacea, {M}utelidae) in {N}igeria}, ' ...
'journal = {Korean Journal of Zoology}, ' ...
'volume = {30(2)}, ' ...
'pages = {140-153}, ' ...
'howpublished = {\url{https://www.environment.gov.au/science/supervising-scientist/publications/open-file-record/biology-and-ecology-velesunio-angasi}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

