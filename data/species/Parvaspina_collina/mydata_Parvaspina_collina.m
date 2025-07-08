function [data, auxData, metaData, txtData, weights] = mydata_Parvaspina_collina
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Parvaspina_collina'; 
metaData.species_en = 'James River spinymussel'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 05];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 19*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HoveNeve1994';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'guess';  
data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 7.1;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HoveNeve1994';

data.Wwi  = 12.9; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(7.1/7.3)^3';

data.Ri = 13.4e3/365;    units.Ri = '1/d';    label.Ri = 'reproduction rate at SL 6 cm'; bibkey.Ri = 'HoveNeve1994';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
 3 2.868
 4 3.383
 5 3.930
 6 4.260
 7 4.380
 8 4.936
 9 4.929
10 5.441
11 5.781
12 6.031
13 6.147
14 6.198
15 6.420
16 6.085
17 6.183
18 6.527
19 7.135];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HoveNeve1994';
comment.tL = 'Data from Clinch River; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
%weights.psd.v = 3 * weights.psd.v;

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
metaData.links.id_CoL = '75T6Y'; % Cat of Life
metaData.links.id_ITIS = '80093'; % ITIS
metaData.links.id_EoL = '52228379'; % Ency of Life
metaData.links.id_Wiki = 'Pleurobema_collina'; % Wikipedia
metaData.links.id_ADW = 'Pleurobema_collina'; % ADW
metaData.links.id_Taxo = '5573810'; % Taxonomicon
metaData.links.id_WoRMS = '1033378'; % WoRMS
metaData.links.id_molluscabase = '1033378'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurobema_collina}}';
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
bibkey = 'HoveNeve1994'; type = 'Article'; bib = [ ...
'author = {Mark C. Hove and Richard J. Neves}, ' ... 
'year = {1994}, ' ...
'title = {Life history of the endangered James spinymussel \emph{Pleurobema collina} ({C}onrad, 1937) ({M}ollusca: {U}nionidae)}, ' ...
'journal = {American Malacological Bulletin}, ' ...
'volume = {11(1)}, ' ...
'pages = {29-40}, ' ...
'howpublished = {\url{http://scholarworks.uark.edu/jaas/vol54/iss1/9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

