function [data, auxData, metaData, txtData, weights] = mydata_Pronodularia_japanensis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Pronodularia_japanensis'; 
metaData.species_en = 'Freshwater mussel'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 10];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'unio';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'NegiKaya2009';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement'; bibkey.Lj  = 'guess';  
data.Lp  = 3.0;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'NegiKaya2009'; 
data.Li  = 5.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'NegiKaya2009';

data.Wwi = 14.4; units.Wwi = 'g';   label.Wwi = 'total wet weight at shell length 5.1 cm';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pleurobema_strodeanum';

data.Ri  = 1.6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Guessed based on value for kap';

% uni-variate data
  
% length - change in length
data.LdL = [ ... % shell length (cm), log10 (growth rate + 1)
1.210	1.735
1.218	1.919
1.282	1.742
1.291	1.926
1.467	1.882
1.787	1.750
2.018	1.448
2.066	1.300
2.075	1.632
2.474	1.182
2.547	1.204
2.707	1.227
2.802	1.013
2.811	1.204
2.931	1.182
3.059	0.895
3.220	1.079
3.283	0.902
3.508	0.939
3.739	0.689
3.762	0.401
3.811	0.637
3.836	0.755
3.867	0.446
4.043	0.409
4.059	0.365
4.076	0.703
4.242	0.173
4.290	0.033
4.339	0.173
4.340	0.593
4.427	0.092
4.429	0.593
4.621	0.564
4.709	0.593
4.805	0.600
4.819	0.107
5.035	-0.033
5.149	0.247
5.341	0.210
5.342	0.372
5.397	0.247];
data.LdL(:,2) = 10.^(data.LdL(:,2)-1)/3650; % removed log transform and convert to cm/d
units.LdL = {'cm', 'cm/d'}; label.LdL = {'shell length', 'change in length'};  
temp.LdL = C2K(22);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'NegiKaya2009';
comment.LdL = 'mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 10 * weights.LdL;
weights.Ri = 0 * weights.Ri;
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
metaData.links.id_CoL = '7ST7G'; % Cat of Life
metaData.links.id_ITIS = '984014'; % ITIS
metaData.links.id_EoL = '49874942'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5612051'; % Taxonomicon
metaData.links.id_WoRMS = '1350519'; % WoRMS
metaData.links.id_molluscabase = '1350519'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Unionidae}}';
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
bibkey = 'NegiKaya2009'; type = 'Article'; bib = [ ...
'author = {Junjiro N. Negishi and Yuichi Kayaba}, ' ... 
'year = {2009}, ' ...
'title = {Effects of handling and density on the growth of the unionoid mussel \emph{Pronodularia japanensis}}, ' ...
'journal = {Journal of the North American Benthological Society}, ' ...
'volume = {28(4)}, ' ...
'pages = {821-831}, ' ...
'howpublished = {\url{http://scholarworks.uark.edu/jaas/vol54/iss1/9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

