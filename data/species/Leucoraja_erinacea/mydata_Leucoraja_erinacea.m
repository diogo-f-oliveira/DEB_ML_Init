function [data, auxData, metaData, txtData, weights] = mydata_Leucoraja_erinacea

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Leucoraja_erinacea'; 
metaData.species_en = 'Little skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 16]; 

%% set data
% zero-variate data;
data.ab = 5.5*30.5;units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Wiki';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed';
data.ap = 8*365;  units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'AnAge';
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 9.7;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
  comment.Lb = 'Wiki 9.3-10.2 cm';
data.Lp  = 40.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
 comment.Lp = 'Wiki for females';
data.Li  = 54;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
 comment.Li = 'Wiki 2-4 kg';

data.Ww42 = 400; units.Ww42 = 'g';   label.Ww42 = 'wet weight at 42 cm';  bibkey.Ww42 = 'ichthyology';
  comment.Ww42 = 'ichthyology: length 40.6-43.2 cm weigh 0.34-0.45 kg';
data.Wwi = 910; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ichthyology';
  comment.Wwi = 'fishbase: 14300 g';

data.Ri  = 30/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
0.019	10.479
0.043	15.803
0.992	25.869
1.015	23.892
1.959	31.725
1.974	32.583
1.996	30.004
1.997	30.605
2.079	31.973
2.904	32.513
2.940	37.235
2.944	32.596
2.956	31.478
2.977	35.686
3.024	32.590
3.045	36.712
3.844	44.813
3.954	39.822
3.957	33.980
3.960	49.701
3.964	30.629
3.970	40.938
3.971	41.711
3.972	34.924
3.974	42.913
3.978	45.061
3.988	43.685
4.070	44.796
4.803	45.858
4.831	46.801
4.909	45.850
4.910	39.149
4.917	42.842
4.921	45.248
4.944	50.143
4.951	46.878
4.961	37.856
4.966	47.993
4.972	43.697
5.010	42.835
5.016	45.842
5.016	38.969
5.041	45.153
5.071	46.869
5.109	46.007
5.851	45.178
5.899	49.126
5.908	47.063
5.942	51.013
5.950	48.263
5.958	45.170
5.966	42.420
6.013	46.025
6.028	47.140
6.048	51.005
6.058	49.028
6.077	45.161
6.982	45.694
6.985	47.154
7.734	49.761
7.783	47.610];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hold1972';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'depth range till 90 m';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Possesses an electric organ located in the tail region';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'temperature range of 1.2-21 C';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6Q69J'; % Cat of Life
metaData.links.id_ITIS = '564130'; % ITIS
metaData.links.id_EoL = '46560523'; % Ency of Life
metaData.links.id_Wiki = 'Leucoraja_erinacea'; % Wikipedia
metaData.links.id_ADW = 'Leucoraja_erinacea'; % ADW
metaData.links.id_Taxo = '178802'; % Taxonomicon
metaData.links.id_WoRMS = '158551'; % WoRMS
metaData.links.id_fishbase = 'Leucoraja-erinacea'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leucoraja_erinacea}}'; 
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
bibkey = 'Hold1972'; type = 'Article'; bib = [ ... 
'author = {M. J. Holden}, ' ...
'year = {1972}, ' ...
'title  = {The growth rates of \emph{Raja brachyura}, \emph{R. clavata} and \emph{R. montaqui} as determined from tagging data}, ' ...
'journal = {J. Physiol. (Lond.)}, ' ...
'volume = {34}, ' ...
'pages = {161--168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leucoraja_erinacea}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sharktrust'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sharktrust.org/shared/id_guides/blonde_ray_st_id_guide.pdf}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/161418/0}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Leucoraja-erinacea.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ichthyology'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/LittleSkate/LittleSkate.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
